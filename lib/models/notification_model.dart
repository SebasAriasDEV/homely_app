import 'dart:convert';

Notification notificationFromJson(String str) =>
    Notification.fromJson(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
  Notification({
    required this.id,
    required this.type,
    required this.content,
    required this.user,
    required this.read,
  });

  final String id;
  final String type;
  final String content;
  final String user;
  final bool read;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["_id"],
        type: json["type"],
        content: json["content"],
        user: json["user"],
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "content": content,
        "user": user,
        "read": read,
      };
}
