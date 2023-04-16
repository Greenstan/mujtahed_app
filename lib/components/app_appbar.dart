import 'package:flutter/material.dart';
import 'package:mujtahed_app/providers/study_time_provider.dart';
import 'package:provider/provider.dart';

// PreferredSize makes it that the widget doesn't decide its own height
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Mujtahed",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          // Consumer to change only the widget that is effected by provider changes
          Consumer<StudyTimeProvider>(builder: (context, studyObject, child) {
            return (DateTime.now().hour > studyObject.startTime.hour &&
                    DateTime.now().hour < studyObject.endTime.hour)
                ? Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("STUDY TIME"),
                  )
                : Container();
          })
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  // Necessary to pass this custom app bar to the appbar argument in the main.dart scaffold
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
