// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    required this.user,
    required this.building,
    required this.facility,
    required this.startTimeUtc,
    required this.endTimeUtc,
    required this.alwaysBlocked,
    required this.id,
  });

  final String user;
  final String building;
  final String facility;
  final DateTime startTimeUtc;
  final DateTime endTimeUtc;
  final bool alwaysBlocked;
  final String id;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        user: json["user"],
        building: json["building"],
        facility: json["facility"],
        startTimeUtc: DateTime.parse(json["startTimeUTC"]),
        endTimeUtc: DateTime.parse(json["endTimeUTC"]),
        alwaysBlocked: json["alwaysBlocked"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "building": building,
        "facility": facility,
        "startTimeUTC": startTimeUtc.toIso8601String(),
        "endTimeUTC": endTimeUtc.toIso8601String(),
        "alwaysBlocked": alwaysBlocked,
        "_id": id,
      };
}
