import 'package:flutter_chat_test_app/domain/entity/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    super.name,
    super.message,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        name: json['name'] ?? "",
        message: json['message'] ?? "",
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json["name"] = name;
    json["message"] = message;
    return json;
  }
}
