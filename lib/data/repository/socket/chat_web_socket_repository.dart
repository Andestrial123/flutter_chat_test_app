import 'package:flutter_chat_test_app/data/remote_data_source/socket/chat_web_socket_service.dart';

import '../../../domain/repositories/socket/chat_web_socket_repository.dart';

class ChatWebSocketRepositoryImpl implements ChatWebSocketRepository {
  final ChatWebSocketService _chatWebSocketService;

  ChatWebSocketRepositoryImpl(this._chatWebSocketService);

  @override
  void connect() => _chatWebSocketService.connect();

  @override
  void sendMessage(String data) => _chatWebSocketService.sendMessage(data);

  @override
  Stream get socketStream => _chatWebSocketService.socketChannel.stream;

  @override
  void disconnect() => _chatWebSocketService.disconnect();
}
