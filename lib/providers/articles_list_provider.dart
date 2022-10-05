// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homely_app/models/server_responses/articles_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:homely_app/models/article_model.dart';

class ArticlesListProvider extends ChangeNotifier {
  List<Article> _articles = [];
  int _totalArticles = 0;
  bool _firstLoadDone = false;
  bool _isFetching = false;

  //Initilaize from and limits for infinite scroll
  int _from = 0;
  int _limit = 8;

  //******************** Getters and Setters ***************
  List<Article> get articles => _articles;
  bool get firstLoadDone => _firstLoadDone;
  int get totalArticles => _totalArticles;

  set firstLoadDone(bool value) {
    _firstLoadDone = value;
  }

  //******************** Functions *************************
  Future<void> getArticles(String token) async {
    //Asegurar que no se hagan 2 request al tiempo
    if (_isFetching) return;
    //Si ya cargamos todos los articulos, no hacer mas requests
    if (firstLoadDone == true && _articles.length == _totalArticles) return;

    //Marcar como fetching
    _isFetching = true;

    //Siempre vamos a bajar de a 8 articulos
    if (_firstLoadDone == false) {
      _from = 0;
      _limit = 8;
    } else {
      _from = _limit;
      _limit = _limit + 8;
    }

    //Http request of the Articles in building
    final url = Uri.parse(
        'http://localhost:8080/api/articles?from=$_from&limit=$_limit');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token,
      },
    );

    if (response.statusCode == 200) {
      final ArticlesListReponse _articlesListResponse =
          ArticlesListReponse.fromJson(jsonDecode(response.body));

      if (_firstLoadDone) {
        _articles = [..._articles, ..._articlesListResponse.articlesFound];
      } else {
        _articles = _articlesListResponse.articlesFound;
      }

      //Guarda el total de articulos en la base de datos
      _totalArticles = _articlesListResponse.totalArticles;
      notifyListeners();
      print(_articlesListResponse.articlesFound.length);
      print(_articles.length);
    } else {
      print(response.body);
    }
    _isFetching = false;
    _firstLoadDone = true;
    notifyListeners();
  }
}
