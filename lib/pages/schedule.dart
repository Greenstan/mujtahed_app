import 'package:flutter/material.dart';
import 'package:mujtahed_app/models/exam.dart';
import 'package:mujtahed_app/providers/exams_list_provider.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_planner/time_planner.dart';

class Schedule extends StatefulWidget {
  Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<TimePlannerTask> createTimeTableExams(List<ExamModel> examList, int startHr, int endHr) {
    List<TimePlannerTask> timeTableElements = [];
    // For Each item in list
    for (int elementCount = 0; elementCount < examList.length; elementCount++) {
      for (int dayCount = 0; dayCount < 5; dayCount++) {
        if (examList[elementCount].examDate.day > (dayCount + DateTime.now().day)) {
          timeTableElements.add(
            TimePlannerTask(
              dateTime: TimePlannerDateTime(
                day: dayCount,
                hour: startHr + elementCount,
                minutes: 15 * elementCount,
              ),
              minutesDuration: 60,
              child: Text("${examList[elementCount].name} - ${examList[elementCount].courseID}"),
            ),
          );
          // Break Task
          if (elementCount + 1 < examList.length) {
            timeTableElements.add(TimePlannerTask(
              dateTime: TimePlannerDateTime(day: dayCount, hour: startHr + elementCount + 1, minutes: 0),
              minutesDuration: 15,
              child: Text("Break"),
              color: Colors.red,
            ));
          }
        }
      }
    }
    ;

    return timeTableElements;
  }

  @override
  Widget build(BuildContext context) {
    final studyTimeProv = Provider.of<StudyTimeProvider>(context);
    final examListProv = Provider.of<ExamListProvider>(context);
    return Container(
      margin: EdgeInsets.all(30),
      width: 500,
      height: 900,
      child: Column(
        children: [
          Text(
            "Week Schedule",
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Roboto',
            ),
          ),
          Container(
            width: double.infinity,
            height: 700,
            child: TimePlanner(
              style: TimePlannerStyle(
                cellHeight: 60,
                cellWidth: 120,
                showScrollBar: true,
                horizontalTaskPadding: 5,
              ),
              tasks: createTimeTableExams(examListProv.examsMainList, studyTimeProv.startTime.hour, studyTimeProv.endTime.hour),
              startHour: studyTimeProv.startTime.hour,
              endHour: studyTimeProv.endTime.hour,
              headers: [
                TimePlannerTitle(title: "Sun"),
                TimePlannerTitle(title: "Mon "),
                TimePlannerTitle(title: "Tues"),
                TimePlannerTitle(title: "Wed"),
                TimePlannerTitle(title: "Thurs"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
