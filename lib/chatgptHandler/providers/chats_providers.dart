import 'package:flutter/cupertino.dart';
import 'package:mujtahed_app/chatgptHandler/models/chat_model.dart';

import '../models/chat_model.dart';
import '../services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  void chatListClear() {
    chatList.clear();
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers({required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll((await ApiService.sendMessageGPT(
        message: msg,
        modelId: chosenModelId,
      )) as Iterable<ChatModel>);
    } else {
      chatList.addAll((await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      )) as Iterable<ChatModel>);
    }
    notifyListeners();
  }
}
