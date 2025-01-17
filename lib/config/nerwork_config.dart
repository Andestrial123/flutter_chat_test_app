import 'dart:io';

abstract base class NetworkConfig {
  String get baseUrl;

  String get baseSocketUrl;
}

final class NetworkConfigDefault extends NetworkConfig {
  final _baseUrl = "BASE_URL";
  final _baseWebSocketUrl = "BASE_WEBSOCKET_URL";

  @override
  String get baseSocketUrl => String.fromEnvironment(_baseWebSocketUrl,
      defaultValue: Platform.isAndroid ? 'ws://10.0.2.2:3000' : 'ws://127.0.0.1:3000');

  @override
  String get baseUrl => String.fromEnvironment(_baseUrl,
      defaultValue: Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://127.0.0.1:3000');
}
