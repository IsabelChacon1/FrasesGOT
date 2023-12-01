import 'dart:convert';

class RandomFrase {
  String sentence;
  Character character;

  RandomFrase({
    required this.sentence,
    required this.character,
  });

  factory RandomFrase.fromRawJson(String str) =>
      RandomFrase.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory RandomFrase.fromJson(Map<String, dynamic> json) => RandomFrase(
        sentence: json["sentence"],
        character: Character.fromJson(json["character"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "sentence": sentence,
  //       "character": character.toJson(),
  //     };
}

class Character {
  String name;
  String slug;
  House? house;
  List<String>? quotes;

  Character({
    required this.name,
    required this.slug,
    this.house,
    this.quotes,
  });

  // factory Character.fromRawJson(String str) =>
  //   Character.fromJson(json.decode(str));

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        slug: json["slug"],
        house: json["house"] == null ? null : House.fromJson(json["house"]),
        quotes: json["quotes"] == null
            ? []
            : List<String>.from(json["quotes"]!.map((x) => x)),
      );
}

class House {
  String name;
  String? slug;
  List<Member>? members;

  House({
    required this.name,
    this.slug,
    this.members,
  });

  factory House.fromRawJson(String str) => House.fromJson(json.decode(str));

  factory House.fromJson(Map<String, dynamic> json) => House(
        name: json["name"],
        slug: json["slug"],
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
      );
}

class Member {
  String? name;
  String? slug;

  Member({
    this.name,
    this.slug,
  });

  factory Member.fromRawJson(String str) => Member.fromJson(json.decode(str));
  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json["name"],
        slug: json["slug"],
      );
}
