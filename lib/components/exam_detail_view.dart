import 'package:flutter/material.dart';
import 'package:mujtahed_app/models/exam.dart';
import 'package:mujtahed_app/models/subject.dart';
import 'package:mujtahed_app/widgets/add_subject_button_widget.dart';
import 'package:mujtahed_app/widgets/exam_title_widget.dart';
import 'package:mujtahed_app/widgets/subject_item.dart';

import 'package:mujtahed_app/widgets/exit_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamDetailPage extends StatefulWidget {
  final ExamModel examObj;
  ExamDetailPage({required this.examObj, Key? key}) : super(key: key);

  @override
  State<ExamDetailPage> createState() => _ExamDetailPageState();
}

class _ExamDetailPageState extends State<ExamDetailPage> {
  ////////////// Widget init functions
  // Sort list of subjects from most difficult to least difficult
  void sortList() {
    widget.examObj.subjectList.sort((a, b) => b.difficulty.compareTo(a.difficulty));
  }

  // Apply sortList function as soon as the widget is loaded
  @override
  void initState() {
    super.initState();
    sortList();
  }

  // Calculate how many subjects were completed as a percentage
  double percentageOfCompleted() {
    // Conditinal sublist creation
    if (widget.examObj.subjectList.isNotEmpty) {
      List<SubjectModel> subjectsCompleted = widget.examObj.subjectList.where((element) => element.isCompleted).toList();
      double percentComplete = (subjectsCompleted.length / widget.examObj.subjectList.length);
      return percentComplete;
    } else {
      return 0;
    }
  }

  void deleteThisSubjectFunction(int ind) {
    setState(() {
      widget.examObj.subjectList.removeAt(ind);
    });
  }

// Function to add new subject object to the list using the AddSubjectForm
  void addNewSubjectToList(String name, String description, int difficulty) {
    final newSubject = SubjectModel(name: name, description: description, difficulty: difficulty, isCompleted: false);
    // Add and resort the list of subjects
    setState(() {
      widget.examObj.subjectList.add(newSubject);
      sortList();
    });

    // Return from Alertdialog to Exam form
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          ExitWidget(),
          // Main Box ( )
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: widget.examObj.currentColor(widget.examObj.type), width: 3.0),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ExamTitleWidget(
                    currentExamTypeSelection: widget.examObj.type,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 50,
                        color: widget.examObj.currentColor(widget.examObj.type),
                      ),
                      Text(
                        "${widget.examObj.examDate.day}/${widget.examObj.examDate.month}",
                        style: TextStyle(
                          fontSize: 30,
                          color: widget.examObj.currentColor(widget.examObj.type),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // Quiz name and Course ID
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.examObj.name,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Oswald",
                  ),
                ),
                Text(
                  widget.examObj.courseID,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Oswald",
                  ),
                )
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.examObj.currentColor(widget.examObj.type),
                width: 3.0,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Topics",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: "Oswald",
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 40,
                          percent: percentageOfCompleted(),
                          lineWidth: 10,
                          progressColor: widget.examObj.currentColor(widget.examObj.type),
                          center: Text("${(percentageOfCompleted() * 100).toInt()}%"),
                        ),
                      ],
                    ),
                  ),
                  // Subjects List
                  Container(
                    height: widget.examObj.subjectList.length <= 1 ? widget.examObj.subjectList.length * 160 : 290,
                    child: ListView.builder(
                      itemCount: widget.examObj.subjectList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return subjectWidget(
                          subjectIndex: index,
                          subjectObj: widget.examObj.subjectList[index],
                          deleteThisSubject: deleteThisSubjectFunction,
                        );
                        ;
                      },
                    ),
                  ),
                  AddSubjectButtonWidget(addNewSubjectToList: addNewSubjectToList),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
