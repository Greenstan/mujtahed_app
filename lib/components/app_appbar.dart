import 'package:flutter/material.dart';
import '/providers/study_time_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading:
      //     Image.asset("assets/Mujtahid.jpg"), // add image to leading position
      centerTitle: true, // center the title
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Mujtahid",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Oswald',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),

          // Consumer to change only the widget that is effected by provider changes
          Consumer<StudyTimeProvider>(builder: (context, studyObject, child) {
            return (DateTime.now().hour > studyObject.startTime.hour && DateTime.now().hour < studyObject.endTime.hour)
                ? Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    child: Text("STUDY TIME"),
                  )
                : Container();
          })
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color.fromARGB(1, 159, 233, 80), Color.fromRGBO(64, 122, 188, 1)],
          ),
        ),
      ),

      // actions: [TextButton(onPressed: onPressed, child: child),

      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
