import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamWidget extends StatelessWidget {
  final ExamModel examObj;
  const ExamWidget({required this.examObj, Key? key}) : super(key: key);

// Function to select color based off of the type of exam
  MaterialColor mainWidgetColor(String examType) {
    if (examType == "Final") {
      return Colors.red;
    } else if (examType == "Mid") {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }

  int examDateToNow() {
    DateTime examDateValue = examObj.examDate;
    DateTime now = DateTime.now();
    int difference = examDateValue.difference(now).inDays;
    return difference;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Container(
              color: mainWidgetColor(this.examObj.type),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.examObj.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.examObj.courseID,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "in ${examDateToNow()} days",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            //Main body of Exam Card
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        size: 50,
                      ),
                      Text(
                        "${this.examObj.examDate.day}/${this.examObj.examDate.month}",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  ElevatedButton(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "View",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        mainWidgetColor(this.examObj.type),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  //Percent of Subjects studied
                  CircularPercentIndicator(
                    radius: 40,
                    percent: 0.03,
                    lineWidth: 10,
                    progressColor: mainWidgetColor(this.examObj.type),
                    center: Text("3%"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
