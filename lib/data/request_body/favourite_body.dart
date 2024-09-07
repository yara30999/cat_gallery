// To parse this JSON data, do
//
//     final favoriteBody = favoriteBodyFromJson(jsonString);

import 'dart:convert';

FavouriteBody favoriteBodyFromJson(String str) =>
    FavouriteBody.fromJson(json.decode(str));

String favoriteBodyToJson(FavouriteBody data) => json.encode(data.toJson());

class FavouriteBody {
  final String imageId;
  final String subId;

  FavouriteBody({
    required this.imageId,
    required this.subId,
  });

  factory FavouriteBody.fromJson(Map<String, dynamic> json) => FavouriteBody(
        imageId: json["image_id"],
        subId: json["sub_id"],
      );

  Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "sub_id": subId,
      };
}
