import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  String? token;

  Future<bool> checkToken() async {
    final _storage = new FlutterSecureStorage();
    token = await _storage.read(key: 'loginToken');
    print('Checking...');
    if (token == null) {
      print('No existe token');
      return false;
    } else {
      print('Ya esta loggeado! Existe token.');
      return true;
    }
  }
}
