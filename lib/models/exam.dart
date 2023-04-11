import './subject.dart';

class Exam {
  String type;
  String name;
  String courseID;
  String examDate;
  List<Subject> subjectList;

  Exam({
    required this.type,
    required this.name,
    required this.courseID,
    required this.examDate,
    required this.subjectList,
  });
}
