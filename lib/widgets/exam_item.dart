// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mujtahed_app/models/subject.dart';
import '../models/exam.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamWidget extends StatelessWidget {
  final ExamModel examObj;
  const ExamWidget({required this.examObj, Key? key}) : super(key: key);

// Function to select color based off of the type of exam
  MaterialColor mainWidgetColor(String examType) {
    switch (examType) {
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

  // Function to calculate how many days remaining until the exam (in days)
  int examDateToNow() {
    DateTime examDateValue = examObj.examDate;
    DateTime now = DateTime.now();
    int difference = examDateValue.difference(now).inDays.round();
    return difference;
  }

// Calculate how many subjects were completed as a percentage
  double percentageOfCompleted() {
    // Conditinal sublist creation
    if(examObj.subjectList.length != 0){
    List<SubjectModel> subjectsCompleted =
        examObj.subjectList.where((element) => element.isCompleted).toList();
    double percentComplete =
        (subjectsCompleted.length / examObj.subjectList.length);
    return percentComplete;
    }else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Container(
              color: mainWidgetColor(examObj.type),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      examObj.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Oswald",
                      ),
                    ),
                  ),
                  Text(
                    examObj.courseID,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Oswald",
                    ),
                  ),
                  Text(
                    "in ${examDateToNow()} days",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Oswald",
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
                        size: 40,
                      ),
                      Text(
                        "${examObj.examDate.day}/${examObj.examDate.month}",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  // Button to go to the exam's details page
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
                        mainWidgetColor(examObj.type),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  //Percent of Subjects studied
                  CircularPercentIndicator(
                    radius: 40,
                    percent: percentageOfCompleted(),
                    lineWidth: 10,
                    progressColor: mainWidgetColor(examObj.type),
                    center: Text("${(percentageOfCompleted() * 100).toInt()}%"),
                  ),
                  // GradientButtonFb1(
                  //   text: "Text",
                  //   onPressed: () => {},
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Test for later
// class GradientButtonFb1 extends StatelessWidget {
//   final String text;
//   final Function() onPressed;
//   const GradientButtonFb1(
//       {required this.text, required this.onPressed, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const primaryColor = Color(0xff4338CA);
//     const secondaryColor = Color(0xff6D28D9);
//     const accentColor = Color(0xffffffff);

//     const double borderRadius = 15;

//     return DecoratedBox(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(borderRadius),
//             gradient:
//                 const LinearGradient(colors: [primaryColor, secondaryColor])),
//         child: ElevatedButton(
//           style: ButtonStyle(
//               elevation: MaterialStateProperty.all(0),
//               alignment: Alignment.center,
//               padding: MaterialStateProperty.all(const EdgeInsets.only(
//                   right: 75, left: 75, top: 15, bottom: 15)),
//               backgroundColor: MaterialStateProperty.all(Colors.transparent),
//               shape: MaterialStateProperty.all(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(borderRadius)),
//               )),
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: const TextStyle(color: accentColor, fontSize: 16),
//           ),
//         ));
//   }
// }
