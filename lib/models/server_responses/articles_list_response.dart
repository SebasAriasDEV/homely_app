// To parse this JSON data, do
//
//     final articlesListReponse = articlesListReponseFromJson(jsonString);

import 'dart:convert';

import 'package:homely_app/models/article_model.dart';

ArticlesListReponse articlesListReponseFromJson(String str) => ArticlesListReponse.fromJson(json.decode(str));

String articlesListReponseToJson(ArticlesListReponse data) => json.encode(data.toJson());

class ArticlesListReponse {
    ArticlesListReponse({
        required this.totalArticles,
        required this.articlesFound,
    });

    final int totalArticles;
    final List<Article> articlesFound;

    factory ArticlesListReponse.fromJson(Map<String, dynamic> json) => ArticlesListReponse(
        totalArticles: json["totalArticles"],
        articlesFound: List<Article>.from(json["articlesFound"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalArticles": totalArticles,
        "articlesFound": List<dynamic>.from(articlesFound.map((x) => x.toJson())),
    };
}


class Building {
    Building({
        required this.id,
        required this.name,
    });

    final String id;
    final String name;

    factory Building.fromJson(Map<String, dynamic> json) => Building(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class User {
    User({
        required this.id,
        required this.unit,
    });

    final String id;
    final String unit;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "unit": unit,
    };
}
