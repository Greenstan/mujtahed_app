import 'package:flutter/material.dart';

class ExamTitleWidget extends StatelessWidget {
  final String? currentExamTypeSelection;
  const ExamTitleWidget({required this.currentExamTypeSelection, Key? key})
      : super(key: key);
  MaterialColor currentColor() {
    switch (currentExamTypeSelection) {
      case 'Final':
        return Colors.red;
      case 'Mid':
        return Colors.blue;
      case 'Quiz':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: currentColor(),
      ),
      padding: EdgeInsets.all(30),
      child: Text(
        // if an exam type is selected then display the selection else display "Add Exam"
        currentExamTypeSelection != null
            ? "${currentExamTypeSelection}"
            : "Add Exam",
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontFamily: "Oswald",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
