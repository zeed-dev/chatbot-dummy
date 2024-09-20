import 'dart:developer';

import 'package:chat_apps/core/models/message_model.dart';
import 'package:chat_apps/core/service/firebase_service.dart';
import 'package:chat_apps/core/utils/constant.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final FirebaseService _firebaseService;
  ChatProvider(this._firebaseService);

  List<Message> messages = [];
  bool isBotTyping = false;

  final Map<String, String> botResponses = {
    "What do you think about AI technology?": "AI technology is revolutionizing various industries, from healthcare to finance!",
    "What’s the most impressive application of AI so far?": "I’d say self-driving cars and natural language processing are at the forefront of AI applications.",
    "Can AI replace human jobs?": "AI will automate many tasks, but it will also create new jobs requiring human creativity and problem-solving.",
  };

  Stream<List<Message>> getMessages() {
    return _firebaseService.getMessages().handleError((error) {
      log('Error getting messages: $error');
    }).map((snapshot) {
      messages = snapshot;
      return messages;
    });
  }

  void sendMessage(String message) {
    final userMessage = Message(
      message: message,
      sender: AppConst.USER,
      time: DateTime.now(),
    );
    messages.add(userMessage);
    isBotTyping = true;
    notifyListeners();

    _firebaseService.saveMessage(userMessage).catchError((error) {
      log('Error saving user message: $error');
    });

    Future.delayed(const Duration(seconds: 2), () {
      isBotTyping = false;
      final response = botResponses[message] ?? "I'm sorry, I don't understand that question.";
      final botMessage = Message(
        message: response,
        sender: AppConst.BOT,
        time: DateTime.now(),
      );
      messages.add(botMessage);
      notifyListeners();

      _firebaseService.saveMessage(botMessage).catchError((error) {
        log('Error saving bot message: $error');
      });
    });
  }
}