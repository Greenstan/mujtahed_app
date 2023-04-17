import 'package:mujtahed_app/models/exam.dart';
import 'package:mujtahed_app/models/subject.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ExamListProvider with ChangeNotifier {
  List<ExamModel> examsMainList = [
    ExamModel(
      type: "Quiz",
      name: "Quiz 1",
      courseID: "MA111",
      examDate: DateTime(DateTime.now().year, 4, 19),
      subjectList: [
        SubjectModel(
          name: "name",
          description: "Something",
          difficulty: 4,
          isCompleted: false,
        )
      ],
    ),
  ];

  get examModel => examsMainList;

  void addExam(ExamModel examObjAdded) {
    examsMainList.add(examObjAdded);
    notifyListeners();
  }

  void changeListeners() {
    notifyListeners();
  }
}
