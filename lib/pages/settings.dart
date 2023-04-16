import 'package:flutter/material.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
// Time variables to temporarily store Datepicker data to then be passed to the appropriate setter
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    final studyTimeProv = Provider.of<StudyTimeProvider>(context);
    startTimeController.text = studyTimeProv.startTimeGetter.format(context);
    endTimeController.text = studyTimeProv.endTimeGetter.format(context);

    return Container(
      margin: EdgeInsets.all(30),
      height: 700,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Settings",
            style: TextStyle(fontSize: 40),
          ),
          // Start Time Picker
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Start Time",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    onSubmitted: (_) {},
                    readOnly: true,
                    textAlign: TextAlign.center,
                    controller: startTimeController,
                    onTap: () async {
                      startTime = await showTimePicker(
                        context: context,
                        initialTime: studyTimeProv.startTimeGetter,
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      // Change provider start time
                      if (startTime != null) {
                        studyTimeProv.startTime = startTime!;

                        setState(() {
                          startTimeController.text =
                              studyTimeProv.startTimeGetter.format(context);
                        });
                        // Apply changes immediately
                        studyTimeProv.changeListeners();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          // End Time Picker
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "End Time",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    onSubmitted: (_) {},
                    readOnly: true,
                    textAlign: TextAlign.center,
                    controller: endTimeController,
                    onTap: () async {
                      endTime = await showTimePicker(
                        context: context,
                        initialTime: studyTimeProv.endTimeGetter,
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      // Change provider end time
                      if (endTime != null) {
                        studyTimeProv.endTime = endTime!;

                        setState(() {
                          endTimeController.text =
                              studyTimeProv.endTimeGetter.format(context);
                        });
                        // Apply changes immediately
                        studyTimeProv.changeListeners();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
