import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_chat_test_app/data/models/chat_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatWebSocketService {
  final String url;
  final Connectivity _connectivity;

  late final StreamSubscription _connectivitySubscription;

  bool _isInitialized = false;

  ChatWebSocketService(
    this._connectivity, {
    required this.url,
  }) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> event) {
      if (event.contains(ConnectivityResult.mobile) || event.contains(ConnectivityResult.wifi)) {
        if (_isInitialized) {
          _channel.sink.close();
          connect();
        }
      }
    });
  }

  late WebSocketChannel _channel;

  final StreamController socketChannel = StreamController.broadcast();

  Future<void> connect() async {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    try {
      await _channel.ready;
      _channel.stream.listen((message) {
        if (message == 'ping') {
          sendMessage('pong');
          return;
        }
        socketChannel.add(parseMessage(message));
      });
      _isInitialized = true;
    } on WebSocketChannelException catch (e) {
      log("Connection failed $e");
    }
  }

  void sendMessage(String data) {
    _channel.sink.add(data);
  }

  void disconnect() {
    _channel.sink.close();
    socketChannel.close();
    _connectivitySubscription.cancel();
  }

  ChatModel parseMessage(String data) {
    return ChatModel.fromJson(jsonDecode(data));
  }
}
