
import 'package:chat_apps/core/utils/text.dart';
import 'package:chat_apps/feature/chat/page/room_chat.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flag),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.android, color: Colors.white),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RoomChatPage(),
                    ),
                  ),
                  title: Text(
                    "AI Assistant",
                    style: AppTheme.title,
                  ),
                  subtitle: Text(
                    "Let's chat with me",
                    style: AppTheme.body,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
