// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:homely_app/models/user_model.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.userFound,
    required this.token,
  });

  final User userFound;
  final String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userFound: User.fromJson(json["userFound"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userFound": userFound.toJson(),
        "token": token,
      };
}
