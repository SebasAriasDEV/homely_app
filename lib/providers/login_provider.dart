// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:homely_app/models/server_responses/login_response.dart';
import 'package:homely_app/models/server_responses/request_errors_response.dart';
import 'package:homely_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _loading = false;
  bool _obscurePassword = true;
  User? currentUser;
  String? errorMessage;

  //************* Getters and setters ****************
  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
  set obscurePassword(bool value) {
    _obscurePassword = value;
    notifyListeners();
  }

  bool get loading => _loading;
  bool get obscurePassword => _obscurePassword;

  //************ Functions ***************************

  // Login User
  Future<String> loginUser() async {
    loading = true;

    final url = Uri.parse('http://localhost:8080/api/auth/login');
    final body = {'email': _email, 'password': _password};

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final LoginResponse _loginResponse =
          LoginResponse.fromJson(jsonDecode(response.body));

      //Save token in secure storage
      const _storage = FlutterSecureStorage();
      await _storage.write(key: 'loginToken', value: _loginResponse.token);

      //Save current user
      currentUser = _loginResponse.userFound;

      loading = false;
      return 'OK';
    } else {
      final ErrorsReponse _errorsReponse =
          ErrorsReponse.fromJson(jsonDecode(response.body));

      //Saves the error message so it can be displayed in the app as snackbar
      errorMessage = _errorsReponse.toString();
      loading = false;
      return response.body;
    }
  }
}
