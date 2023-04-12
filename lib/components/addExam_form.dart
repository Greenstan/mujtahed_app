import 'package:flutter/material.dart';

class AddExamForm extends StatefulWidget {
  AddExamForm({Key? key}) : super(key: key);

  @override
  State<AddExamForm> createState() => _AddExamFormState();
}

class _AddExamFormState extends State<AddExamForm> {
  final TextEditingController examNameController = TextEditingController();

  static const List<String> examTypesList = ["Mid", "Final", "Quiz"];
  String? currentExamTypeSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      height: 500,
      width: double.infinity,
      child: Column(
        children: [
          // Form title
          Text(
            "Add a New Exam",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Oswald",
              fontWeight: FontWeight.bold,
            ),
          ),
          // Form body
          TextField(
            decoration: InputDecoration(
              labelText: "Exam Topic",
            ),
            controller: examNameController,
          ),
          DropdownButtonFormField(
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
