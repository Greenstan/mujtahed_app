import 'package:flutter/material.dart';
import 'package:mujtahed_app/chatgptHandler/components/chatbot.dart';

class StudyHelper extends StatefulWidget {
  StudyHelper({Key? key}) : super(key: key);

  @override
  State<StudyHelper> createState() => _StudyHelperState();
}

class _StudyHelperState extends State<StudyHelper> {
  @override
  Widget build(BuildContext context) {
    return ChatbotComponent();
  }
}
