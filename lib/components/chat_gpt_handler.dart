import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

final openAI = OpenAI.instance.build(
    token: "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",
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    isLog: true);

void chatComplete() async {
  final request = ChatCompleteText(messages: [
    Map.of({"role": "user", "content": 'How is Pi Calculated?'})
  ], maxToken: 200, model: ChatModel.chatGptTurbo0301Model);

  final response = await openAI.onChatCompletion(request: request);
  for (var element in response!.choices) {
    print("data -> ${element.message?.content}");
  }
}
