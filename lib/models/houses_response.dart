import 'dart:convert';
//https://api.gameofthronesquotes.xyz/v1/houses

class HousesResponse {
  String slug;
  String name;
  List<Member> members;

  HousesResponse({
    required this.slug,
    required this.name,
    required this.members,
  });

  factory HousesResponse.fromRawJson(String str) =>
      HousesResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory HousesResponse.fromJson(Map<String, dynamic> json) => HousesResponse(
        slug: json["slug"],
        name: json["name"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Member {
  String name;
  String slug;

  Member({
    required this.name,
    required this.slug,
  });

  factory Member.fromRawJson(String str) => Member.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
      };
}
