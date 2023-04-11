import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            "Schedule",
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
