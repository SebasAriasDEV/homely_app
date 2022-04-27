// To parse this JSON data, do
//
//     final clasificado = clasificadoFromJson(jsonString);

import 'dart:convert';

Clasificado clasificadoFromJson(String str) =>
    Clasificado.fromJson(json.decode(str));

String clasificadoToJson(Clasificado data) => json.encode(data.toJson());

class Clasificado {
  static List<Clasificado> get testingClasificados => [
        Clasificado(
            userID: '11111',
            userUnit: '208 TN',
            title:
                'Labore esse aliqua laborum nostrud dolor sit commodo ex est.',
            content:
                'Officia deserunt in ullamco labore aliqua eiusmod enim ullamco velit. Consectetur eu nulla elit est est in officia eiusmod ullamco aliquip ad occaecat. Eiusmod minim excepteur veniam qui. Quis elit duis incididunt cupidatat consequat consequat velit qui in non.',
            buildingID: 'ZZZZZZ',
            buildingName: 'ILARCO 114',
            isOpen: true,
            createdAt: DateTime(2015, 03, 25),
            id: '1111111',
            img:
                'https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
            type: 'Zonas Comunes',
            contactPhone: "3111234569"),
        Clasificado(
            userID: '11111',
            userUnit: '208 TN',
            title:
                'Labore esse aliqua laborum nostrud dolor sit commodo ex est.',
            content:
                'Officia deserunt in ullamco labore aliqua eiusmod enim ullamco velit. Consectetur eu nulla elit est est in officia eiusmod ullamco aliquip ad occaecat. Eiusmod minim excepteur veniam qui. Quis elit duis incididunt cupidatat consequat consequat velit qui in non.',
            buildingID: 'ZZZZZZ',
            buildingName: 'ILARCO 114',
            isOpen: true,
            createdAt: DateTime(2022, 03, 25),
            id: '1111111',
            img:
                'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
            type: 'Servicios',
            contactPhone: "3111234569"),
        Clasificado(
            userID: '11111',
            userUnit: '1607 TS',
            title:
                'Labore esse aliqua laborum nostrud dolor sit commodo ex est.',
            content:
                'Officia deserunt in ullamco labore aliqua eiusmod enim ullamco velit. Consectetur eu nulla elit est est in officia eiusmod ullamco aliquip ad occaecat. Eiusmod minim excepteur veniam qui. Quis elit duis incididunt cupidatat consequat consequat velit qui in non.',
            buildingID: 'ZZZZZZ',
            buildingName: 'ILARCO 114',
            isOpen: true,
            createdAt: DateTime(2022, 03, 25),
            id: '1111111',
            img:
                'https://images.pexels.com/photos/2635038/pexels-photo-2635038.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
            type: 'Productos',
            contactPhone: "3111234569"),
      ];

  Clasificado({
    required this.userID,
    required this.userUnit,
    required this.title,
    required this.content,
    required this.buildingID,
    required this.buildingName,
    required this.isOpen,
    required this.createdAt,
    required this.id,
    required this.img,
    required this.type,
    required this.contactPhone,
  });

  final String userID;
  final String userUnit;
  final String title;
  final String content;
  final String buildingID;
  final String buildingName;
  final bool isOpen;
  final DateTime createdAt;
  final String id;
  final String img;
  final String type;
  final String contactPhone;

  factory Clasificado.fromJson(Map<String, dynamic> json) => Clasificado(
        userID: json["user"]["_id"],
        userUnit: json["user"]["unit"],
        title: json["title"],
        content: json["content"],
        buildingID: json["building"]["_id"],
        buildingName: json["building"]["name"],
        isOpen: json["isOpen"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["_id"],
        img: json["img"],
        type: json["type"],
        contactPhone: json["contactPhone"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "userUnit": userUnit,
        "title": title,
        "content": content,
        "buildingID": buildingID,
        "buildingName": buildingName,
        "isOpen": isOpen,
        "createdAt": createdAt.toIso8601String(),
        "_id": id,
        "img": img,
        "type": type,
        "contactPhone": contactPhone,
      };
}
