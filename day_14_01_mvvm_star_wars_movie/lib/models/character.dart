import 'dart:convert';

Character getCharacterfromjson(String str) =>
    Character.fromJson(json.decode(str));

class Character {
  final String name, gender, birthYear, eyeColor;
  final int height;

  Character(
      {this.name, this.gender, this.birthYear, this.eyeColor, this.height});

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json['name'],
        gender: json['gender'],
        birthYear: json['birthYear'],
        eyeColor: json['eye_color'],
        height: int.parse(json['height']),
      );
}
