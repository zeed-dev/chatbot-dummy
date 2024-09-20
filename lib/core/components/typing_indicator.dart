import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.grey,
        ),
        SizedBox(width: 8),
        Text('AI is typing...'),
      ],
    );
  }
}
