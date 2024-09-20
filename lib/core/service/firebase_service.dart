import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_apps/core/models/message_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveMessage(Message message) async {
    try {
      await _firestore.collection('messages').add({
        'message': message.message,
        'sender': message.sender,
        'time': message.time.toIso8601String(),
      });
    } catch (e) {
      log('Error saving message: $e');
      throw 'Error saving message: $e';
    }
  }

  Stream<List<Message>> getMessages() {
    try {
      return _firestore
          .collection('messages')
          .orderBy('time', descending: false)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return Message(
            message: data['message'],
            sender: data['sender'],
            time: DateTime.parse(data['time']),
          );
        }).toList();
      });
    } catch (e) {
      log('Error getting messages: $e');
      return Stream.error('Error getting messages: $e');
    }
  }
}