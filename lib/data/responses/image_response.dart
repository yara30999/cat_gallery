// To parse this JSON data, do
//
//     final imageResponse = imageResponseFromJson(jsonString);

import 'dart:convert';

import 'breeds_response.dart';

CatImageResponse imageResponseFromJson(String str) =>
    CatImageResponse.fromJson(json.decode(str));

String imageResponseToJson(CatImageResponse data) => json.encode(data.toJson());

class CatImageResponse {
  final String id;
  final String url;
  final List<BreedResponse> breeds;
  final int width;
  final int height;

  CatImageResponse({
    required this.id,
    required this.url,
    required this.breeds,
    required this.width,
    required this.height,
  });

  factory CatImageResponse.fromJson(Map<String, dynamic> json) =>
      CatImageResponse(
        id: json["id"],
        url: json["url"],
        breeds: List<BreedResponse>.from(
            json["breeds"].map((x) => BreedResponse.fromJson(x))),
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "breeds": List<BreedResponse>.from(breeds.map((x) => x.toJson())),
        "width": width,
        "height": height,
      };
}
