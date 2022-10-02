// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isDeleted,
    required this.role,
    required this.building,
    required this.unit,
    required this.createdAt,
    // required this.fcmToken,
    // required this.fcmTokenDate,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isDeleted;
  final String role;
  final String building;
  final String unit;
  final DateTime createdAt;
  // final String fcmToken;
  // final DateTime fcmTokenDate;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        isDeleted: json["isDeleted"],
        role: json["role"],
        building: json["building"],
        unit: json["unit"],
        createdAt: DateTime.parse(json["createdAt"]),
        // fcmToken: json["fcmToken"],
        // fcmTokenDate: DateTime.parse(json["fcmTokenDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "isDeleted": isDeleted,
        "role": role,
        "building": building,
        "unit": unit,
        "createdAt": createdAt.toIso8601String(),
        // "fcmToken": fcmToken,
        // "fcmTokenDate": fcmTokenDate.toIso8601String(),
      };
}
