import 'package:flutter/material.dart';

class ExamListWidget extends StatefulWidget {
  ExamListWidget({Key? key}) : super(key: key);

  @override
  State<ExamListWidget> createState() => _ExamListWidgetState();
}

Card examCardWidget() {
  return Card(
    child: Container(
      padding: EdgeInsets.all(50),
      child: Row(
        children: [
          Text("Exam"),
        ],
      ),
    ),
  );
}

class _ExamListWidgetState extends State<ExamListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, ind) {
          return examCardWidget();
        },
      ),
    );
  }
}
