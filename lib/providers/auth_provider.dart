import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:homely_app/models/building_model.dart';
import 'package:homely_app/models/server_responses/building_info_response.dart';
import 'package:homely_app/models/server_responses/login_response.dart';
import 'package:homely_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String? _token;
  User? _currentUser;
  Building? _currentBuilding;

  //*********** Getters and setters *********
  User get currentUser => _currentUser!;
  Building get currentBuilding => _currentBuilding!;
  String get token => _token!;

  set currentUser(User user) {
    _currentUser = user;
  }

  //*********** Funciones  ******************

  //Validar si ya esta loggeado
  Future<bool> validateLoginStatus() async {
    const _storage = FlutterSecureStorage();
    _token = await _storage.read(key: 'loginToken');

    if (_token == null) {
      //If there is no token in the secure storage
      return false;
    } else {
      //Validate if token is valid
      final isValid = await renewToken();
      //If token is valid, request the building info to use in the app.
      if (isValid) saveBuilding();
      return isValid;
    }
  }

  //Renew del token
  Future<bool> renewToken() async {
    final url = Uri.parse('http://localhost:8080/api/auth/renew');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-token': _token!,
      },
    );

    if (response.statusCode == 200) {
      final LoginResponse _loginResponse =
          LoginResponse.fromJson(jsonDecode(response.body));

      //Guarda el usuario para usarlo en la app de ahora en adelante
      _currentUser = _loginResponse.userFound;

      //Save token in secure storage
      const _storage = FlutterSecureStorage();
      await _storage.write(key: 'loginToken', value: _loginResponse.token);
      return true;
    }
    return false;
  }

  //Save currentbuilding
  Future<void> saveBuilding() async {
    final url = Uri.parse('http://localhost:8080/api/buildings/buildingInfo');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-token': _token!,
      },
    );

    if (response.statusCode == 200) {
      final BuildingInfoReponse _buildingInfoResponse =
          BuildingInfoReponse.fromJson(jsonDecode(response.body));

      //Guarda el building Info para usarlo en la app de ahora en adelante
      _currentBuilding = _buildingInfoResponse.foundBuilding;
    }
  }

  //Logout
  Future<void> logout() async {
    const _storage = FlutterSecureStorage();
    _storage.write(key: 'loginToken', value: 'AAAAA');
    // _storage.delete(key: 'loginToken');
  }
}
