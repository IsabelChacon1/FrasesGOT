import 'dart:convert';

//https://api.gameofthronesquotes.xyz/v1/characters
class Character {
  String name;
  String slug;
  House? house;
  List<String> quotes;

  Character({
    required this.name,
    required this.slug,
    required this.house,
    required this.quotes,
  });

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        slug: json["slug"],
        house: json["house"] == null ? null : House.fromJson(json["house"]),
        quotes: List<String>.from(json["quotes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "house": house?.toJson(),
        "quotes": List<dynamic>.from(quotes.map((x) => x)),
      };
}

class House {
  String slug;
  String name;

  House({
    required this.slug,
    required this.name,
  });

  factory House.fromRawJson(String str) => House.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory House.fromJson(Map<String, dynamic> json) => House(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };
}
