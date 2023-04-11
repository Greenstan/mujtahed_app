// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  // Change the tab function taken from the popup when hovering over onTabChange property
  void Function(int)? onTabChange;

  NavBar({this.onTabChange, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      backgroundColor: Colors.cyan.shade100,
      // Function to pass the value of the tab to the onChangeFunction
      onTabChange: (val) => onTabChange!(val),
      gap: 8,
      tabs: [
        GButton(
          icon: Icons.settings,
          text: "Settings",
        ),
        GButton(
          icon: Icons.sunny,
          text: "Main",
        ),
        GButton(
          icon: Icons.schedule,
          text: "Schedule",
        ),
      ],
    );
  }
}

// class BottomNavBarMallika1 extends StatelessWidget {
//   const BottomNavBarMallika1({Key? key}) : super(key: key);

//   final orangeColor = const Color(0xffFF8527);

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.white,
//       child: SizedBox(
//         height: 56,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconBottomBar(
//                   text: "Home",
//                   icon: Icons.home_outlined,
//                   selected: true,
//                   onPressed: () {}),
//               IconBottomBar(
//                   text: "Search",
//                   icon: Icons.search_outlined,
//                   selected: false,
//                   onPressed: () {}),
//               IconBottomBar2(
//                   text: "Add",
//                   icon: Icons.add_outlined,
//                   selected: false,
//                   onPressed: () {}),
//               IconBottomBar(
//                   text: "Cart",
//                   icon: Icons.local_grocery_store_outlined,
//                   selected: false,
//                   onPressed: () {}),
//               IconBottomBar(
//                   text: "Calendar",
//                   icon: Icons.date_range_outlined,
//                   selected: false,
//                   onPressed: () {})
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IconBottomBar extends StatelessWidget {
//   const IconBottomBar(
//       {Key? key,
//       required this.text,
//       required this.icon,
//       required this.selected,
//       required this.onPressed})
//       : super(key: key);
//   final String text;
//   final IconData icon;
//   final bool selected;
//   final Function() onPressed;

//   final orangeColor = const Color(0xffFF8527);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: onPressed,
//           icon: Icon(
//             icon,
//             size: 25,
//             color: selected ? orangeColor : Colors.black54,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class IconBottomBar2 extends StatelessWidget {
//   const IconBottomBar2(
//       {Key? key,
//       required this.text,
//       required this.icon,
//       required this.selected,
//       required this.onPressed})
//       : super(key: key);
//   final String text;
//   final IconData icon;
//   final bool selected;
//   final Function() onPressed;
//   final orangeColor = const Color(0xffFF8527);
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       backgroundColor: orangeColor,
//       child: IconButton(
//         onPressed: onPressed,
//         icon: Icon(
//           icon,
//           size: 25,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
