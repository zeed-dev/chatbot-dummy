
import 'package:chat_apps/core/components/app_bars.dart';
import 'package:chat_apps/core/components/chat_bubble.dart';
import 'package:chat_apps/core/components/message_input_field.dart';
import 'package:chat_apps/core/components/typing_indicator.dart';
import 'package:chat_apps/core/ext/padding_ext.dart';
import 'package:chat_apps/core/models/mock_data.dart';
import 'package:chat_apps/core/utils/constant.dart';
import 'package:chat_apps/feature/chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomChatPage extends StatefulWidget {
  const RoomChatPage({
    super.key,
  });

  @override
  State<RoomChatPage> createState() => _RoomChatPageState();
}

class _RoomChatPageState extends State<RoomChatPage> {
  final ScrollController _scrollController = ScrollController();
  late ChatProvider chatProvider;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    chatProvider = Provider.of<ChatProvider>(context, listen: false);

    if (chatProvider.messages.isNotEmpty) {
      _scrollToBottom();
    }

    super.initState();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          _scrollToBottom();
          return Column(
            children: [
              StreamBuilder<List<Message>>(
                stream: chatProvider.getMessages(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: Padding(
                      padding: paddingSymmetric(horizontal: 16.0),
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: chatProvider.messages.length + (chatProvider.isBotTyping ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == chatProvider.messages.length && chatProvider.isBotTyping) {
                            return const TypingIndicator();
                          }
                      
                          final message = chatProvider.messages[index];
                          final isUser = message.sender == AppConst.USER;
                      
                          return ChatBubble(
                            message: message.message,
                            time: message.time,
                            isUser: isUser,
                          );
                        },
                      ),
                    ),
                  );
                }
              ),
              MessageInputField(
                onSend: (message) => chatProvider.sendMessage(message),
              ),
            ],
          );
        },
      ),
    );
  }
}