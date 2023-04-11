import 'package:flutter/material.dart';

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
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Icon(
            Icons.chat,
            color: Colors.black,
            size: 30,
          )
        ],
      ),
      backgroundColor: Colors.cyan.shade200,
    );
  }

  // Necessary to pass this custom app bar to the appbar argument in the main.dart scaffold
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
