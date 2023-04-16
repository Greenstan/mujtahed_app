import 'package:flutter/material.dart';
import 'package:mujtahed_app/models/subject.dart';
import 'package:percent_indicator/percent_indicator.dart';

class subjectWidget extends StatefulWidget {
  SubjectModel subjectObj;
  final Function deleteThisSubject;
  final int subjectIndex;
  subjectWidget(
      {required this.subjectIndex,
      required this.deleteThisSubject,
      required this.subjectObj,
      Key? key})
      : super(key: key);

  @override
  State<subjectWidget> createState() => _subjectWidgetState();
}

class _subjectWidgetState extends State<subjectWidget> {
  // Note: To access subjectObj properties add widget. before the property (Ex. widget.subjectObj.name)

  MaterialColor progressColor() {
    int difficultyValue = (widget.subjectObj.difficulty);

    if (difficultyValue >= 1 && difficultyValue <= 3) {
      return Colors.green;
    } else if (difficultyValue > 3 && difficultyValue <= 6) {
      return Colors.yellow;
    } else if (difficultyValue > 6 && difficultyValue < 9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  void deleteThisSubjectFunctionArg() {
    widget.deleteThisSubject(widget.subjectIndex);
  }

  double cardHeight = 180;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.subjectObj.name,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteThisSubjectFunctionArg();
                      },
                      icon: Icon(Icons.cancel),
                      color: Colors.red,
                      iconSize: 24,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Difficulty",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  LinearPercentIndicator(
                    percent: widget.subjectObj.difficulty / 10,
                    width: 150,
                    lineHeight: 15,
                    barRadius: Radius.circular(5),
                    progressColor: progressColor(),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.subjectObj.description,
                      ),
                    ),
                    Checkbox(
                        value: widget.subjectObj.isCompleted,
                        // Switch checkbox value
                        onChanged: (val) {
                          setState(() {
                            widget.subjectObj.isCompleted =
                                !widget.subjectObj.isCompleted;
                          });
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
