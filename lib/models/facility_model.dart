// To parse this JSON data, do
//
//     final facility = facilityFromJson(jsonString);

import 'dart:convert';

Facility facilityFromJson(String str) => Facility.fromJson(json.decode(str));

String facilityToJson(Facility data) => json.encode(data.toJson());

class Facility {
  static List<Facility> get testingFacilities => [
        Facility(
          id: '11111',
          name: 'Gimnasio',
          building: 'ZZZZZ',
          capacity: 10,
          startTimeUtc: 8,
          endTimeUtc: 22,
          isDeleted: false,
          img:
              'https://images.pexels.com/photos/260352/pexels-photo-260352.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
        ),
        Facility(
          id: '11111',
          name: 'Ping Pong',
          building: 'ZZZZZ',
          capacity: 10,
          startTimeUtc: 8,
          endTimeUtc: 22,
          isDeleted: false,
          img:
              'https://images.pexels.com/photos/569986/pexels-photo-569986.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
        ),
        Facility(
            id: '11111',
            name: 'Piscina',
            building: 'ZZZZZ',
            capacity: 10,
            startTimeUtc: 8,
            endTimeUtc: 22,
            isDeleted: false,
            img:
                'https://images.pexels.com/photos/221457/pexels-photo-221457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
      ];

  Facility({
    required this.id,
    required this.name,
    required this.building,
    required this.capacity,
    required this.startTimeUtc,
    required this.endTimeUtc,
    required this.isDeleted,
    required this.img,
  });

  final String id;
  final String name;
  final String building;
  final int capacity;
  final int startTimeUtc;
  final int endTimeUtc;
  final bool isDeleted;
  final String img;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["_id"],
        name: json["name"],
        building: json["building"],
        capacity: json["capacity"],
        startTimeUtc: json["startTimeUTC"],
        endTimeUtc: json["endTimeUTC"],
        isDeleted: json["isDeleted"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "building": building,
        "capacity": capacity,
        "startTimeUTC": startTimeUtc,
        "endTimeUTC": endTimeUtc,
        "isDeleted": isDeleted,
        "img": img,
      };
}
