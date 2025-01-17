class ChatEntity {
  final bool? myMessage;
  final String? name;
  final String? message;

  ChatEntity({
    this.name,
    this.message,
    this.myMessage,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) => ChatEntity(
        name: json['name'] ?? "",
        message: json['message'] ?? "",
        myMessage: json['myMessage'] ?? false,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json["name"] = name;
    json["message"] = message;
    json["myMessage"] = myMessage;
    return json;
  }
}
