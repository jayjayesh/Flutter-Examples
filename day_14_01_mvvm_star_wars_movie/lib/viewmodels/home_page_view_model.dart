import 'package:day_14_01_mvvm_star_wars_movie/models/character.dart';
import 'package:day_14_01_mvvm_star_wars_movie/models/film.dart';
import 'package:day_14_01_mvvm_star_wars_movie/models/planet.dart';
import 'package:day_14_01_mvvm_star_wars_movie/services/webservice.dart';
import 'package:flutter/material.dart';

enum LoadingStatus {
  complete,
  searching,
  empty,
}

class HomePageViewModel with ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;

  List<FilmCellViewModel> films = [];
  List<CharacterCellViewModel> characters = [];
  List<PlanetCellViewModel> planets = [];

  Future getAllFilmCellVm() async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    final List<Film> fetchedFilms = await Webservice().fetchAllFilmsFromWebservice();
    films = fetchedFilms
        .map((filmTemp) => FilmCellViewModel(filmObject: filmTemp))
        .toList();

    loadingStatus =
        films.isEmpty ? LoadingStatus.empty : LoadingStatus.complete;
    notifyListeners();
  }

  Future getAllCharacterCellVm() async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

   final List<Character> fetchedCharacters =
        await Webservice().fetchAllCharactersFromWebservice();
    characters = fetchedCharacters
        .map((characterTemp) =>
            CharacterCellViewModel(characterObject: characterTemp))
        .toList();

    loadingStatus =
        films.isEmpty ? LoadingStatus.empty : LoadingStatus.complete;
    notifyListeners();
  }

  Future getAllPlanetCellVm() async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

   final List<Planet> fetchedPlanets =
        await Webservice().fetchAllPlanetsFromWebservice();
    planets = fetchedPlanets
        .map((planetTemp) => PlanetCellViewModel(planetObject: planetTemp))
        .toList();

    loadingStatus =
        films.isEmpty ? LoadingStatus.empty : LoadingStatus.complete;
    notifyListeners();
  }
}

class FilmCellViewModel {
  final Film filmObject;

  FilmCellViewModel({@required this.filmObject});

  String get title {
    return filmObject.title;
  }

  String get directer {
    return filmObject.director;
  }

  String get producer {
    return filmObject.producer;
  }

  String get openingCrawl {
    return filmObject.openingCrawl;
  }
}

class CharacterCellViewModel {
  final Character characterObject;

  CharacterCellViewModel({@required this.characterObject});

  String get name {
    return characterObject.name;
  }

  String get gender {
    return characterObject.gender;
  }

  String get birthYear {
    return characterObject.birthYear;
  }

  String get eyeColor {
    return characterObject.eyeColor;
  }

  int get height {
    return characterObject.height;
  }
}

class PlanetCellViewModel {
  final Planet planetObject;

  PlanetCellViewModel({@required this.planetObject});

  String get name {
    return planetObject.name;
  }

  String get climate {
    return planetObject.climate;
  }

  String get terrain {
    return planetObject.terrain;
  }

  String get gravity {
    return planetObject.gravity;
  }

  String get population {
    return planetObject.population;
  }

  int get diameter {
    return planetObject.diameter;
  }
}
