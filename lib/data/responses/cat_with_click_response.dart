// To parse this JSON data, do
//
//     final catWithClickResponse = catWithClickResponseFromJson(jsonString);

import 'dart:convert';

import 'breeds_response.dart';

List<CatWithClickResponse> catWithClickResponseFromJson(String str) =>
    List<CatWithClickResponse>.from(
        json.decode(str).map((x) => CatWithClickResponse.fromJson(x)));

String catWithClickResponseToJson(List<CatWithClickResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatWithClickResponse {
  final List<CategoryResponse>? categories;
  final List<BreedResponse>? breeds;
  final String id;
  final String url;
  final int width;
  final int height;
  final VoteResponse? vote;
  final DateTime? createdAt;
  final FavouritesResponse? favourite;

  CatWithClickResponse({
    this.categories,
    this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    this.vote,
    this.createdAt,
    this.favourite,
  });

  factory CatWithClickResponse.fromJson(Map<String, dynamic> json) =>
      CatWithClickResponse(
        categories: json["categories"] == null
            ? []
            : List<CategoryResponse>.from(
                json["categories"]!.map((x) => CategoryResponse.fromJson(x))),
        breeds: json["breeds"] == null
            ? []
            : List<BreedResponse>.from(
                json["breeds"]!.map((x) => BreedResponse.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        vote: json["vote"] == null ? null : VoteResponse.fromJson(json["vote"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        favourite: json["favourite"] == null
            ? null
            : FavouritesResponse.fromJson(json["favourite"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "breeds": breeds == null
            ? []
            : List<dynamic>.from(breeds!.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width,
        "height": height,
        "vote": vote?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "favourite": favourite?.toJson(),
      };
}

class CategoryResponse {
  final int id;
  final String name;

  CategoryResponse({
    required this.id,
    required this.name,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class FavouritesResponse {
  final int id;

  FavouritesResponse({
    required this.id,
  });

  factory FavouritesResponse.fromJson(Map<String, dynamic> json) =>
      FavouritesResponse(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class VoteResponse {
  final int id;
  final int value;

  VoteResponse({
    required this.id,
    required this.value,
  });

  factory VoteResponse.fromJson(Map<String, dynamic> json) => VoteResponse(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
