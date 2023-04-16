import 'package:flutter/material.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import 'package:provider/provider.dart';
import '../components/app_navbar.dart';
import '../components/app_appbar.dart';
import './schedule.dart';
import './settings.dart';
import './exams_list.dart';
import './chatbot.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageState = 1;

  void changeScreen(int val) {
    setState(() {
      _pageState = val;
    });
  }

  final pagesList = [
    Settings(),
    ExamsList(),
    StudyHelper(),
    Schedule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: NavBar(
        onTabChange: (val) => changeScreen(val),
      ),
      body: pagesList[_pageState],
    );
  }
}
