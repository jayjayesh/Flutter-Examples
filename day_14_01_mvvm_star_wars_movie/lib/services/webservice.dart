import 'dart:convert';

import 'package:day_14_01_mvvm_star_wars_movie/models/character.dart';
import 'package:day_14_01_mvvm_star_wars_movie/models/planet.dart';
import 'package:http/http.dart' as http;
import 'package:day_14_01_mvvm_star_wars_movie/models/film.dart';
import 'package:day_14_01_mvvm_star_wars_movie/utils/constants.dart';
import 'package:alice/alice.dart';
import '../main.dart';

class Webservice {
  Alice alice = Alice(
      showNotification: true, navigatorKey: navigatorKey, darkTheme: false);

  Future<List<Film>> fetchAllFilmsFromWebservice() async {
    final response = await http.get(Constants.FILM_API_URL);
    alice.onHttpResponse(response);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('failed to fetchAllFilmsFromWebservice');
    }
  }

  Future<List<Character>> fetchAllCharactersFromWebservice() async {
    final response = await http.get(Constants.CHARACTER_API_URL);
    alice.onHttpResponse(response);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('failed to fetchAllCharactersFromWebservice');
    }
  }

  Future<List<Planet>> fetchAllPlanetsFromWebservice() async {
    final response = await http.get(Constants.PLANET_API_URL);
    alice.onHttpResponse(response);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((json) => Planet.fromJson(json)).toList();
    } else {
      throw Exception('failed to fetchAllPlanetsFromWebservice');
    }
  }
}
