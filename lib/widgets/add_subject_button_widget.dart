import 'package:flutter/material.dart';
import 'package:mujtahed_app/components/add_subject_form.dart';
import 'package:mujtahed_app/models/subject.dart';

class AddSubjectButtonWidget extends StatelessWidget {
  final Function addNewSubjectToList;
  AddSubjectButtonWidget({required this.addNewSubjectToList});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
