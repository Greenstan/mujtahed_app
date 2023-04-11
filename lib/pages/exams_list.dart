import 'package:flutter/material.dart';
import '../widgets/exam_list_widget.dart';

class ExamsList extends StatefulWidget {
  ExamsList({Key? key}) : super(key: key);

  @override
  State<ExamsList> createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              "Exams",
              style: TextStyle(fontSize: 40),
            ),
          ),
          ExamListWidget(),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 30, horizontal: 300)),
              ),
              child: Icon(Icons.add),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
