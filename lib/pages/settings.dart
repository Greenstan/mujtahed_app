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
  TimeOfDay? startTime;

  @override
  Widget build(BuildContext context) {
    final startTimeProv = Provider.of<StudyTimeProvider>(context);
    startTimeController.text = startTimeProv.startTimeGetter.format(context);
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
                        initialTime: startTimeProv.startTimeGetter,
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      startTimeProv.startTime = startTime!;

                      setState(() {
                        startTimeController.text =
                            startTimeProv.startTimeGetter.format(context);
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
