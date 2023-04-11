import 'package:flutter/material.dart';

class StudyHelper extends StatefulWidget {
  StudyHelper({Key? key}) : super(key: key);

  @override
  State<StudyHelper> createState() => _StudyHelperState();
}

class _StudyHelperState extends State<StudyHelper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            "StudyHelper",
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
