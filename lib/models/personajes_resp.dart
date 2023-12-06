import 'dart:convert';

class Personajes {
  List<Result> results;

  Personajes({
    required this.results,
  });

  factory Personajes.fromRawJson(String str) =>
      Personajes.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Personajes.fromJson(Map<String, dynamic> json) => Personajes(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "results": List<dynamic>.from(results.map((x) => x.toJson())),
  //     };
}

class Result {
  String objectId;
  String name;
  String slug;
  House? house;
  List<String> quotes;
  DateTime createdAt;
  DateTime updatedAt;
  Fotito fotito;

  Result({
    required this.objectId,
    required this.name,
    required this.slug,
    required this.house,
    required this.quotes,
    required this.createdAt,
    required this.updatedAt,
    required this.fotito,
  });
  get fullPosterImg {
    if (this.fotito != null) {
      return 'https://image.tmdb.org/t/p/w500${this.fotito}';
    }
    //return 'https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg';
    return 'http://i.stack.imgur.com/GNhxO.png';
  }

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        objectId: json["objectId"],
        name: json["name"],
        slug: json["slug"],
        house: json["house"] == null ? null : House.fromJson(json["house"]),
        quotes: List<String>.from(json["quotes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        fotito: Fotito.fromJson(json["fotito"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "objectId": objectId,
  //       "name": name,
  //       "slug": slug,
  //       "house": house?.toJson(),
  //       "quotes": List<dynamic>.from(quotes.map((x) => x)),
  //       "createdAt": createdAt.toIso8601String(),
  //       "updatedAt": updatedAt.toIso8601String(),
  //       "fotito": fotito.toJson(),
  //     };
}

class Fotito {
  Type type;
  String name;
  String url;

  Fotito({
    required this.type,
    required this.name,
    required this.url,
  });

  factory Fotito.fromRawJson(String str) => Fotito.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Fotito.fromJson(Map<String, dynamic> json) => Fotito(
        type: typeValues.map[json["__type"]]!,
        name: json["name"],
        url: json["url"],
      );

  // Map<String, dynamic> toJson() => {
  //       "__type": typeValues.reverse[type],
  //       "name": name,
  //       "url": url,
  //     };
}

enum Type { FILE }

final typeValues = EnumValues({"File": Type.FILE});

class House {
  String slug;
  String name;

  House({
    required this.slug,
    required this.name,
  });

  factory House.fromRawJson(String str) => House.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory House.fromJson(Map<String, dynamic> json) => House(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
