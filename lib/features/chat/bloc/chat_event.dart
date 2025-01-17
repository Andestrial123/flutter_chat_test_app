part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatSendEvent extends ChatEvent {
  final String data;

  ChatSendEvent(this.data);
}

class ChatReceiveEvent extends ChatEvent {
  final ChatModel data;

  ChatReceiveEvent(this.data);
}
