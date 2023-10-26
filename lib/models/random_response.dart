import 'dart:convert';

class Random {
  String sentence;
  Character character;

  Random({
    required this.sentence,
    required this.character,
  });

  factory Random.fromRawJson(String str) => Random.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory Random.fromJson(Map<String, dynamic> json) => Random(
        sentence: json["sentence"],
        character: Character.fromJson(json["character"]),
      );

  Map<String, dynamic> toJson() => {
        "sentence": sentence,
        "character": character.toJson(),
      };
}

class Character {
  String name;
  String slug;
  House house;

  Character({
    required this.name,
    required this.slug,
    required this.house,
  });

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        slug: json["slug"],
        house: House.fromJson(json["house"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "house": house.toJson(),
      };
}

class House {
  String name;
  String slug;

  House({
    required this.name,
    required this.slug,
  });

  factory House.fromRawJson(String str) => House.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory House.fromJson(Map<String, dynamic> json) => House(
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
      };
}
