import 'package:flutter/material.dart';
import '../widgets/exam_list_widget.dart';
import '../widgets/exam_item.dart';

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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
