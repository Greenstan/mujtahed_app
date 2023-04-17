import './subject.dart';
import 'package:flutter/material.dart';

class ExamModel {
  String type;
  String name;
  String courseID;
  DateTime examDate;
  List<SubjectModel> subjectList;

  ExamModel({
    required this.type,
    required this.name,
    required this.courseID,
    required this.examDate,
    required this.subjectList,
  });
  // Function to decide color based off of the exam type
  MaterialColor currentColor(String currentExamTypeSelection) {
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
}
