import 'package:flutter/material.dart';
import 'package:mujtahed_app/models/exam.dart';

class ExamDetailPage extends StatefulWidget {
  final ExamModel examObj;
  ExamDetailPage({required this.examObj, Key? key}) : super(key: key);

  @override
  State<ExamDetailPage> createState() => _ExamDetailPageState();
}

class _ExamDetailPageState extends State<ExamDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
