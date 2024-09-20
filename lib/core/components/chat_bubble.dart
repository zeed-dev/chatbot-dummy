import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final DateTime time;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: isUser ? Colors.green[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(message),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat('hh:mm a').format(time),
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
