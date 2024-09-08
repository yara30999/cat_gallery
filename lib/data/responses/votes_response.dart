// To parse this JSON data, do
//
//     final votesResponse = votesResponseFromJson(jsonString);

import 'dart:convert';
import 'image_response.dart';

List<VotesResponse> votesResponseFromJson(String str) =>
    List<VotesResponse>.from(
        json.decode(str).map((x) => VotesResponse.fromJson(x)));

String votesResponseToJson(List<VotesResponse> data) =>
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
