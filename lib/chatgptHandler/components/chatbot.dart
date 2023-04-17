import 'package:flutter/material.dart';

import 'package:mujtahed_app/chatgptHandler/providers/chats_providers.dart';
// import 'package:mujtahed_app/chatgptHandler/services/services.dart';
import 'package:mujtahed_app/chatgptHandler/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../providers/models_provider.dart';

import '../widgets/text_widget.dart';

class ChatbotComponent extends StatefulWidget {
  ChatbotComponent({Key? key}) : super(key: key);

  @override
  State<ChatbotComponent> createState() => _ChatbotComponentState();
}

class _ChatbotComponentState extends State<ChatbotComponent> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    void scrollListToEND() {
      _listScrollController.animateTo(_listScrollController.position.maxScrollExtent, duration: const Duration(seconds: 5), curve: Curves.easeOut);
    }

    Future<void> sendMessageFCT({required ModelsProvider modelsProvider, required ChatProvider chatProvider}) async {
      if (_isTyping) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: TextWidget(
              label: "You can't send multiple messages at a time",
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      if (textEditingController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: TextWidget(
              label: "Please type a message",
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      try {
        String msg = textEditingController.text;
        setState(() {
          _isTyping = true;
          // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
          chatProvider.addUserMessage(msg: msg);
          textEditingController.clear();
          focusNode.unfocus();
        });
        await chatProvider.sendMessageAndGetAnswers(msg: msg, chosenModelId: modelsProvider.getCurrentModel);
        // chatList.addAll(await ApiService.sendMessage(
        //   message: textEditingController.text,
        //   modelId: modelsProvider.getCurrentModel,
        // ));
        setState(() {});
      } catch (error) {
        debugPrint("error $error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: TextWidget(
            label: error.toString(),
          ),
          backgroundColor: Colors.red,
        ));
      } finally {
        setState(() {
          scrollListToEND();
          _isTyping = false;
        });
      }
    }

    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.getChatList.length, //chatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatProvider.getChatList[index].msg, // chatList[index].msg,
                    chatIndex: chatProvider.getChatList[index].chatIndex, //chatList[index].chatIndex,
                    shouldAnimate: chatProvider.getChatList.length - 1 == index,
                  );
                }),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.black,
              size: 18,
            ),
          ],
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      onPressed: () {
                        chatProvider.chatListClear();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.black),
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        await sendMessageFCT(modelsProvider: modelsProvider, chatProvider: chatProvider);
                      },
                      decoration: const InputDecoration.collapsed(hintText: "Ask me anything", hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await sendMessageFCT(modelsProvider: modelsProvider, chatProvider: chatProvider);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
