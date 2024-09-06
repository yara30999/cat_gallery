// To parse this JSON data, do
//
//     final getVotesResponse = getVotesResponseFromJson(jsonString);

import 'dart:convert';

List<VotesResponse> getVotesResponseFromJson(String str) =>
    List<VotesResponse>.from(
        json.decode(str).map((x) => VotesResponse.fromJson(x)));

String getVotesResponseToJson(List<VotesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VotesResponse {
  final int id;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final int value;
  final String countryCode;
  final ImageResponse image;

  VotesResponse({
    required this.id,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.value,
    required this.countryCode,
    required this.image,
  });

  factory VotesResponse.fromJson(Map<String, dynamic> json) => VotesResponse(
        id: json["id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        value: json["value"],
        countryCode: json["country_code"],
        image: ImageResponse.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_id": imageId,
        "sub_id": subId,
        "created_at": createdAt.toIso8601String(),
        "value": value,
        "country_code": countryCode,
        "image": image.toJson(),
      };
}

class ImageResponse {
  final String id;
  final String url;

  ImageResponse({
    required this.id,
    required this.url,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
