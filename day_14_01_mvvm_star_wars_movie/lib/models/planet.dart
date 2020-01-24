import 'dart:convert';

Planet getPlanetfromjson(String str) => Planet.fromJson(json.decode(str));

class Planet {
  final String name, climate, terrain, gravity, population;
  final int diameter;

  Planet({
    this.name,
    this.climate,
    this.terrain,
    this.gravity,
    this.population,
    this.diameter,
  });

  factory Planet.fromJson(Map<String, dynamic> json) => Planet(
        name: json['name'],
        climate: json['climate'],
        terrain: json['terrain'],
        gravity: json['gravity'],
        population: json['population'],
        diameter: int.parse(json['diameter']),
      );
}
