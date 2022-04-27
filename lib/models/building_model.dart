// To parse this JSON data, do
//
//     final building = buildingFromJson(jsonString);

import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  Building({
    required this.name,
    required this.isDeleted,
    required this.createdAt,
    required this.latitude,
    required this.longitude,
    required this.hasNews,
    required this.hasClasif,
    required this.hasBooking,
    required this.hasPqrs,
    required this.hasCitofonia,
    required this.id,
  });

  final String name;
  final bool isDeleted;
  final DateTime createdAt;
  final double latitude;
  final double longitude;
  final bool hasNews;
  final bool hasClasif;
  final bool hasBooking;
  final bool hasPqrs;
  final bool hasCitofonia;
  final String id;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        name: json["name"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        hasNews: json["hasNews"],
        hasClasif: json["hasClasif"],
        hasBooking: json["hasBooking"],
        hasPqrs: json["hasPQRS"],
        hasCitofonia: json["hasCitofonia"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "hasNews": hasNews,
        "hasClasif": hasClasif,
        "hasBooking": hasBooking,
        "hasPQRS": hasPqrs,
        "hasCitofonia": hasCitofonia,
        "_id": id,
      };
}
