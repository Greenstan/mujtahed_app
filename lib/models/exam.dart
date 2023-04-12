import './subject.dart';

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
}
