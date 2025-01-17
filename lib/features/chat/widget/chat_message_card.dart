import 'package:flutter/material.dart';
import 'package:flutter_chat_test_app/domain/entity/chat_entity.dart';

class ChatMessageCard extends StatelessWidget {
  final ChatEntity chatEntity;

  const ChatMessageCard({super.key, required this.chatEntity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatEntity.myMessage != true ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
        child: UnconstrainedBox(
          child: Container(
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(minHeight: 30, minWidth: 80, maxWidth: 200),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: chatEntity.myMessage == true
                        ? [Colors.cyan, Colors.indigoAccent]
                        : [Colors.grey, Colors.black26]),
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chatEntity.name.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  Text(chatEntity.message.toString(),
                      textAlign: TextAlign.start, style: const TextStyle(fontSize: 15, color: Colors.white)),
                ],
              )),
        ),
      ),
    );
  }
}
