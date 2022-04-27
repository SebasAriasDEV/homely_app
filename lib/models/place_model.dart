// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));

String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  Place({
    required this.id,
    required this.name,
    required this.openHours,
    required this.address,
    required this.phoneNumber,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.isDeleted,
    required this.distanceTemp,
  });

  final String id;
  final String name;
  final String openHours;
  final String address;
  final String phoneNumber;
  final String description;
  final double latitude;
  final double longitude;
  final bool isDeleted;
  final double distanceTemp;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["_id"],
        name: json["name"],
        openHours: json["openHours"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        description: json["description"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        isDeleted: json["isDeleted"],
        distanceTemp: json["distanceTemp"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "openHours": openHours,
        "address": address,
        "phoneNumber": phoneNumber,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "isDeleted": isDeleted,
        "distanceTemp": distanceTemp,
      };
}
