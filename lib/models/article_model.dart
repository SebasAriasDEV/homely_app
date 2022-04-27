import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  static List<Article> get testingArticles => [
        Article(
          id: '11111',
          userID: 'AAAAA',
          userUnit: '208 (TN)',
          title: 'Nueva Noticia que rige a partir del primero de Junio.',
          content:
              'Nulla veniam eu amet in sunt consectetur consequat non sint laborum voluptate fugiat ullamco ut.Do tempor ad sint nostrud fugiat nulla enim ipsum et.',
          keyWord: 'Zonas Comunes',
          buildingID: 'ZZZZZZZZ',
          buildingName: 'ILARCO 114',
          isDeleted: false,
          createdAt: DateTime(2022, 04, 25),
          img:
              'https://images.pexels.com/photos/11592902/pexels-photo-11592902.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
        ),
        Article(
          id: '11111',
          userID: 'AAAAA',
          userUnit: '208 (TN)',
          title:
              'Nueva Noticia que rige a partir del primero de Septiembre del 2022.',
          content:
              'Nulla veniam eu amet in sunt consectetur consequat non sint laborum voluptate fugiat ullamco ut.Do tempor ad sint nostrud fugiat nulla enim ipsum et.',
          keyWord: 'Convivencia',
          buildingID: 'ZZZZZZZZ',
          buildingName: 'ILARCO 114',
          isDeleted: false,
          createdAt: DateTime(2022, 04, 25),
          img:
              'https://images.pexels.com/photos/11642205/pexels-photo-11642205.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
        ),
      ];

  Article({
    required this.id,
    required this.userID,
    required this.userUnit,
    required this.title,
    required this.content,
    required this.keyWord,
    required this.buildingID,
    required this.buildingName,
    required this.isDeleted,
    required this.createdAt,
    required this.img,
  });

  final String id;
  final String userID;
  final String userUnit;
  final String title;
  final String content;
  final String keyWord;
  final String buildingID;
  final String buildingName;
  final bool isDeleted;
  final DateTime createdAt;
  final String img;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        userID: json["user"]["_id"],
        userUnit: json["user"]["unit"],
        title: json["title"],
        content: json["content"],
        keyWord: json["keyWord"],
        buildingID: json["building"]["_id"],
        buildingName: json["building"]["name"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userID": userID,
        "userUnit": userUnit,
        "title": title,
        "content": content,
        "keyWord": keyWord,
        "buildingID": buildingID,
        "buildingName": buildingName,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "img": img,
      };
}
