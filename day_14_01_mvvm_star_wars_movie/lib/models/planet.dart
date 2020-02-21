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
        name: json['name'] ?? 'No Name Found',
        climate: json['climate'] ?? 'No Climate Found',
        terrain: json['terrain'] ?? 'No Terrain Found',
        gravity: json['gravity'] ?? 'No Gravity Found',
        population: json['population'] ?? 'No Poppulation Found',
        diameter: int.parse(json['diameter']) ?? 0,
      );
}
