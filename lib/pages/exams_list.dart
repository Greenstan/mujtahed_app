import 'package:flutter/material.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/exam_list_widget.dart';
import '../widgets/exam_item.dart';
import '../components/add_exam_form.dart';
import '../models/exam.dart';
import '../models/subject.dart';

class ExamsList extends StatefulWidget {
  ExamsList({Key? key}) : super(key: key);

  @override
  State<ExamsList> createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  List<ExamModel> mainExamList = [
    ExamModel(
      type: "Quiz",
      name: "Quiz 1",
      courseID: "MA111",
      examDate: DateTime(DateTime.now().year, 4, 19),
      subjectList: [
        SubjectModel(
          name: "name",
          description: "Something",
          difficulty: 4,
          isCompleted: false,
        )
      ],
    ),
  ];

////////  Inner Widget functions
  void addExamToList(String name, String courseID, String examType,
      DateTime examDate, List<SubjectModel> subjectsList) {
    final newExam = ExamModel(
        type: examType,
        name: name,
        courseID: courseID,
        examDate: examDate,
        subjectList: subjectsList);
    setState(() {
      mainExamList.add(newExam);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // The providers will be called every time the page is run therefore the initialization must be doen in the build widget
    final startTimeProv = Provider.of<StudyTimeProvider>(context);

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(27),
            child: Text(
              "Exams",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Oswald",
              ),
            ),
          ),
          ExamListWidget(
            examList: mainExamList,
          ),
          Text(
            startTimeProv.startTime.format(context),
          ),
          //Button section
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                // Create new temporary page to render the form
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: AddExamForm(
                        addThisExam: addExamToList,
                      ),
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
