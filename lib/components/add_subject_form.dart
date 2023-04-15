import 'package:flutter/material.dart';
import 'package:mujtahed_app/widgets/exit_widget.dart';

class AddSubjectForm extends StatefulWidget {
  final Function addSubject;
  AddSubjectForm({required this.addSubject, Key? key}) : super(key: key);

  @override
  State<AddSubjectForm> createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<AddSubjectForm> {
  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController subjectDescriptionController =
      TextEditingController();
  double difficultySliderValue = 0;

  void addNewSubject() {
    widget.addSubject(
        subjectNameController.text,
        subjectDescriptionController.text,
        (difficultySliderValue * 10).toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExitWidget(),
          Text(
            "Subject Name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Oswald",
            ),
          ),
          TextField(
            controller: subjectNameController,
            onSubmitted: (_) {
              addNewSubject();
            },
          ),
          Text(
            "Subject Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Oswald",
            ),
          ),
          TextField(
            controller: subjectDescriptionController,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            onSubmitted: (_) {
              addNewSubject();
            },
          ),
          Text(
            "Difficulty",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Oswald",
            ),
          ),
          Row(
            children: [
              Slider(
                  value: difficultySliderValue,
                  divisions: 10,
                  onChanged: (val) {
                    setState(() {
                      difficultySliderValue = val;
                    });
                  }),
              Text(
                "${(difficultySliderValue * 10).toInt()}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Oswald",
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    addNewSubject();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
