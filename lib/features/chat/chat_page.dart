import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_test_app/features/chat/widget/chat_message_card.dart';
import 'package:flutter_chat_test_app/shared/widgets/text_fields.dart';

import '../../di.dart';
import 'bloc/chat_bloc.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        getIt(),
        getIt(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebSocket Demo'),
        ),
        body: Column(
          children: [
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatReceiveState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.chatList.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ChatMessageCard(
                          chatEntity: state.chatList[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Builder(builder: (context) {
              return ChatMessageTextField(
                onSendMessage: () {
                  if (_controller.text.isNotEmpty) {
                    context.read<ChatBloc>().add(ChatSendEvent(_controller.text));
                    _controller.clear();
                  }
                },
                controller: _controller,
              );
            }),
          ],
        ),
      ),
    );
  }
}
