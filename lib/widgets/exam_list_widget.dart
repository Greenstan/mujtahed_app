import 'package:flutter/material.dart';
import '../widgets/exam_item.dart';
import '../models/exam.dart';
import '../models/subject.dart';

class ExamListWidget extends StatefulWidget {
  ExamListWidget({Key? key}) : super(key: key);

  @override
  State<ExamListWidget> createState() => _ExamListWidgetState();
}

class _ExamListWidgetState extends State<ExamListWidget> {
  List<ExamModel> sample = [
    ExamModel(
      type: "Quiz",
      name: "Quiz 1",
      courseID: "MA111",
      examDate: DateTime(DateTime.now().year, 4, 19),
      subjectList: [SubjectModel()],
    ),
    ExamModel(
      type: "Mid",
      name: "Mid",
      courseID: "CE212",
      examDate: DateTime(DateTime.now().year, 4, 30),
      subjectList: [SubjectModel()],
    ),
    ExamModel(
      type: "Final",
      name: "Final",
      courseID: "MA203",
      examDate: DateTime(DateTime.now().year, 5, 10),
      subjectList: [SubjectModel()],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: sample.length,
        itemBuilder: (ctx, ind) {
          return ExamWidget(
            examObj: sample[ind],
          );
        },
      ),
    );
  }
}
