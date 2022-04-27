// To parse this JSON data, do
//
//     final pqr = pqrFromJson(jsonString);

import 'dart:convert';

Pqr pqrFromJson(String str) => Pqr.fromJson(json.decode(str));

String pqrToJson(Pqr data) => json.encode(data.toJson());

class Pqr {
  Pqr({
    required this.user,
    required this.content,
    required this.building,
    required this.isDone,
    required this.isDeleted,
    required this.createdAt,
    required this.completedAt,
    required this.id,
  });

  final String user;
  final String content;
  final String building;
  final bool isDone;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime completedAt;
  final String id;

  factory Pqr.fromJson(Map<String, dynamic> json) => Pqr(
        user: json["user"],
        content: json["content"],
        building: json["building"],
        isDone: json["isDone"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        completedAt: DateTime.parse(json["completedAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "content": content,
        "building": building,
        "isDone": isDone,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "_id": id,
      };
}
