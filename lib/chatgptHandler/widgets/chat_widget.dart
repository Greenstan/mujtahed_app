import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:mujtahed_app/chatgptHandler/constants/constants.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex, this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? Colors.black : scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset(
                //   chatIndex == 0
                //       ? AssetsManager.userImage
                //       : AssetsManager.userImage,
                //   height: 30,
                //   width: 30,
                // ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,
                        )
                      : shouldAnimate
                          ? DefaultTextStyle(
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                              child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  repeatForever: false,
                                  displayFullTextOnTap: true,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      msg.trim(),
                                    ),
                                  ]),
                            )
                          : Text(
                              msg.trim(),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                ),
                // chatIndex == 0
                //     ? const SizedBox.shrink()
                //     : Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         mainAxisSize: MainAxisSize.min,
                //         children: const [
                //           Icon(
                //             Icons.tag_faces_rounded,
                //             color: Colors.white,
                //           ),
                //           SizedBox(
                //             width: 5,
                //           ),
                //           Icon(
                //             Icons.chat,
                //             color: Colors.white,
                //           )
                //         ],
                //       ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
