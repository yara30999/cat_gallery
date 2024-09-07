// To parse this JSON data, do
//
//     final favoriteSingleImageResponse = favoriteSingleImageResponseFromJson(jsonString);

import 'dart:convert';

FavouriteSingleImageResponse favoriteSingleImageResponseFromJson(String str) =>
    FavouriteSingleImageResponse.fromJson(json.decode(str));

String favoriteSingleImageResponseToJson(FavouriteSingleImageResponse data) =>
    json.encode(data.toJson());

class FavouriteSingleImageResponse {
  final String message;
  final int id;

  FavouriteSingleImageResponse({
    required this.message,
    required this.id,
  });

  factory FavouriteSingleImageResponse.fromJson(Map<String, dynamic> json) =>
      FavouriteSingleImageResponse(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}
