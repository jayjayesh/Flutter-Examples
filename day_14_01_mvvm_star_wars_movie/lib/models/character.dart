import 'dart:convert';

Character getCharacterfromjson(String str) =>
    Character.fromJson(json.decode(str));

class Character {
  final String name, gender, birthYear, eyeColor;
  final int height;

  Character(
      {this.name, this.gender, this.birthYear, this.eyeColor, this.height});

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json['name'] ?? 'No Name Found',
        gender: json['gender'] ?? 'No Gender Found',
        birthYear: json['birthYear'] ?? 'No BirthYear Found',
        eyeColor: json['eye_color'] ?? 'No Eye Color Found',
        height: int.parse(json['height']) ?? 0,
      );
}
