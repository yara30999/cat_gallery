// To parse this JSON data, do
//
//     final getFavoritesResponsey = getFavoritesResponseyFromJson(jsonString);

import 'dart:convert';

import 'image_response.dart';

List<GetFavoritesResponse> getFavoritesResponseyFromJson(String str) =>
    List<GetFavoritesResponse>.from(
        json.decode(str).map((x) => GetFavoritesResponse.fromJson(x)));

String getFavoritesResponseyToJson(List<GetFavoritesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFavoritesResponse {
  final int id;
  final String userId;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final ImageResponse image;

  GetFavoritesResponse({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });

  factory GetFavoritesResponse.fromJson(Map<String, dynamic> json) =>
      GetFavoritesResponse(
        id: json["id"],
        userId: json["user_id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: ImageResponse.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_id": imageId,
        "sub_id": subId,
        "created_at": createdAt.toIso8601String(),
        "image": image.toJson(),
      };
}
