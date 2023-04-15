import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mujtahed_app/components/add_subject_form.dart';
import 'package:mujtahed_app/models/subject.dart';
import 'package:mujtahed_app/widgets/exit_widget.dart';
import 'package:mujtahed_app/widgets/subject_item.dart';

class AddExamForm extends StatefulWidget {
  final Function addThisExam;
  AddExamForm({required this.addThisExam, Key? key}) : super(key: key);

  @override
  State<AddExamForm> createState() => _AddExamFormState();
}

class _AddExamFormState extends State<AddExamForm> {
  // All Text controllers of the Textfields of the form
  final TextEditingController examNameController = TextEditingController();
  final TextEditingController courseIDController = TextEditingController();
  final TextEditingController examDateController = TextEditingController();
  List<SubjectModel> subjectsList = [];
  DateTime? selectedDate;
  // Exam types options to be used by DropdownButtonFormField in the form
  static const List<String> examTypesList = ["Mid", "Final", "Quiz"];
  String? currentExamTypeSelection;

  ////////////// Widget init functions
  // Sort list of subjects from most difficult to least difficult
  void sortList() {
    subjectsList.sort((a, b) => b.difficulty.compareTo(a.difficulty));
  }

  // Apply sortList function as soon as the widget is loaded
  @override
  void initState() {
    super.initState();
    sortList();
  }

////////////// inner Widget functions
// Function to add new subject object to the list using the AddSubjectForm
  void addNewSubjectToList(String name, String description, int difficulty) {
    final newSubject = SubjectModel(
        name: name,
        description: description,
        difficulty: difficulty,
        isCompleted: false);
    // Add and resort the list of subjects
    setState(() {
      subjectsList.add(newSubject);
      sortList();
    });

    // Return from Alertdialog to Exam form
    Navigator.pop(context);
  }

  void deleteThisSubjectFunction(int ind) {
    setState(() {
      subjectsList.removeAt(ind);
    });
  }

////////////// Outer Widget functions
  void addExam() {
    widget.addThisExam(examNameController.text, courseIDController.text,
        currentExamTypeSelection, selectedDate, subjectsList);
  }

// Function to decide color based off of the exam type
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
      padding: EdgeInsets.all(50),
      height: 900,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ExitWidget(),
          // Form title
          Container(
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
          ),
          // Form body
          TextField(
            onSubmitted: (_) => addExam(),
            decoration: InputDecoration(
              labelText: "Exam Topic",
            ),
            controller: examNameController,
          ),
          // Type in Course ID
          TextField(
            onSubmitted: (_) => addExam(),
            decoration: InputDecoration(
              labelText: "Course ID",
            ),
            controller: courseIDController,
          ),
          // Select exam type (Mid, Quiz, Final)
          DropdownButtonFormField(
            // Initial value of the dropdown
            hint: Text("Choose the exam type"),
            value: currentExamTypeSelection,
            items:
                examTypesList.map<DropdownMenuItem<String>>((String typeVal) {
              return DropdownMenuItem<String>(
                value: typeVal,
                child: Text(typeVal),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                currentExamTypeSelection = val.toString();
              });
            },
          ),
          // Select exam date using buil-in picker
          TextField(
            onSubmitted: (_) => addExam(),
            decoration: InputDecoration(
                labelText: "Select Exam Date",
                icon: Icon(Icons.calendar_month)),
            controller: examDateController,
            readOnly: true,
            onTap: () async {
              selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
              if (selectedDate != null) {
                setState(() {
                  String dateFormatted =
                      '${selectedDate?.day}/${selectedDate?.month}';
                  examDateController.text = dateFormatted;
                });
              }
            },
          ),
          Container(
            // margin: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Topics",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Oswald",
                  ),
                ),
              ],
            ),
          ),
          Container(
            // Height of list is the number of subject objects times the card height of each object (160) if the number of objects is less than 0
            height: subjectsList.length <= 1 ? subjectsList.length * 160 : 290,
            child: ListView.builder(
              itemCount: subjectsList.length,
              itemBuilder: (context, index) {
                return subjectWidget(
                  subjectIndex: index,
                  subjectObj: subjectsList[index],
                  deleteThisSubject: deleteThisSubjectFunction,
                );
              },
            ),
          ),
          // Show pop up subject form
          Column(
            children: [
              IconButton(
                  icon: Icon(Icons.add_box_outlined),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: AddSubjectForm(
                            addSubject: addNewSubjectToList,
                          ));
                        });
                  }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(300, 30),
                  ),
                ),
                onPressed: () {
                  addExam();
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Oswald",
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//Test for later
// class EmailInputFb1 extends StatelessWidget {
//   final TextEditingController inputController;
//   const EmailInputFb1({Key? key, required this.inputController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const primaryColor = Color(0xff4338CA);
//     const secondaryColor = Color(0xff6D28D9);
//     const accentColor = Color(0xffffffff);
//     const backgroundColor = Color(0xffffffff);
//     const errorColor = Color(0xffEF4444);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Email",
//           style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.normal,
//               color: Colors.white.withOpacity(.9)),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Container(
//           height: 50,
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//                 offset: const Offset(12, 26),
//                 blurRadius: 50,
//                 spreadRadius: 0,
//                 color: Colors.grey.withOpacity(.1)),
//           ]),
//           child: TextField(
//             controller: inputController,
//             onChanged: (value) {
//               //Do something wi
//             },
//             keyboardType: TextInputType.emailAddress,
//             style: const TextStyle(fontSize: 14, color: Colors.black),
//             decoration: InputDecoration(
//               // prefixIcon: Icon(Icons.email),
//               filled: true,
//               fillColor: accentColor,
//               hintText: 'Enter your email',
//               hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//               border: const OutlineInputBorder(
//                 borderSide: BorderSide(color: primaryColor, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//               focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: secondaryColor, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//               errorBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: errorColor, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//               enabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: primaryColor, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
