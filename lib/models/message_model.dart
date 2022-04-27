// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    required this.pqr,
    required this.author,
    required this.receiver,
    required this.building,
    required this.content,
    required this.isDeleted,
    required this.createdAt,
    required this.id,
  });

  final String pqr;
  final String author;
  final String receiver;
  final String building;
  final String content;
  final bool isDeleted;
  final DateTime createdAt;
  final String id;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        pqr: json["pqr"],
        author: json["author"],
        receiver: json["receiver"],
        building: json["building"],
        content: json["content"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "pqr": pqr,
        "author": author,
        "receiver": receiver,
        "building": building,
        "content": content,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "_id": id,
      };
}
