// To parse this JSON data, do
//
//     final errorsReponse = errorsReponseFromJson(jsonString);

import 'dart:convert';

ErrorsReponse errorsReponseFromJson(String str) =>
    ErrorsReponse.fromJson(json.decode(str));

String errorsReponseToJson(ErrorsReponse data) => json.encode(data.toJson());

class ErrorsReponse {
  ErrorsReponse({
    required this.errors,
  });

  final List<Error> errors;

  factory ErrorsReponse.fromJson(Map<String, dynamic> json) => ErrorsReponse(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };

  @override
  String toString() {
    String result = '';
    for (var error in errors) {
      result += '${error.msg}. ';
    }
    return result;
  }
}

class Error {
  Error({
    required this.msg,
    required this.param,
    required this.location,
  });

  final String msg;
  final String param;
  final String location;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        msg: json["msg"],
        param: json["param"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "param": param,
        "location": location,
      };
}
