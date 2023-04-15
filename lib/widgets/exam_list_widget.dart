import 'package:flutter/material.dart';
import '../widgets/exam_item.dart';
import '../models/exam.dart';
import '../models/subject.dart';

class ExamListWidget extends StatefulWidget {
  List<ExamModel> examList;
  ExamListWidget({required this.examList, Key? key}) : super(key: key);

  @override
  State<ExamListWidget> createState() => _ExamListWidgetState();
}

class _ExamListWidgetState extends State<ExamListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: widget.examList.length,
        itemBuilder: (context, index) {
          return ExamWidget(
            examObj: widget.examList[index],
          );
        },
      ),
    );
  }
}
