import 'package:flutter/material.dart';
import 'package:mujtahed_app/providers/exams_list_provider.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import 'package:provider/provider.dart';
import '../components/exam_list_component.dart';
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
  @override
  Widget build(BuildContext context) {
    final examListProviderInstance = Provider.of<ExamListProvider>(context);

////////  Inner Widget functions
    void addExamToList(String name, String courseID, String examType, DateTime examDate, List<SubjectModel> subjectsList) {
      final newExam = ExamModel(type: examType, name: name, courseID: courseID, examDate: examDate, subjectList: subjectsList);
      // setState(() {
      //   mainExamList.add(newExam);
      // });
      examListProviderInstance.addExam(newExam);

      Navigator.pop(context);
    }
    // The providers will be called every time the page is run therefore the initialization must be doen in the build widget

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
            examList: examListProviderInstance.examsMainList,
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
