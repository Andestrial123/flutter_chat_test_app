part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatReceiveState extends ChatState {
  final List<ChatEntity> chatList;

  ChatReceiveState(this.chatList);
}

class ChatErrorState extends ChatState {
  final String error;

  ChatErrorState(this.error);
}
