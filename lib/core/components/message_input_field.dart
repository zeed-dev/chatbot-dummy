import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({
    super.key,
    required this.onSend,
  });

  final Function(String) onSend;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Send a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              // Validate if the input is empty
              if (controller.text.isEmpty) return;

              // Call the onSend function
              onSend(controller.text);
              controller.clear();
            },
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
