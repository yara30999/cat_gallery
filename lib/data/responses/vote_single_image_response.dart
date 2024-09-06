// To parse this JSON data, do
//
//     final voteSingleImageResponse = voteSingleImageResponseFromJson(jsonString);

import 'dart:convert';

VoteSingleImageResponse voteSingleImageResponseFromJson(String str) =>
    VoteSingleImageResponse.fromJson(json.decode(str));

String voteSingleImageResponseToJson(VoteSingleImageResponse data) =>
    json.encode(data.toJson());

class VoteSingleImageResponse {
  final String message;
  final int id;
  final String imageId;
  final String subId;
  final int value;
  final String countryCode;

  VoteSingleImageResponse({
    required this.message,
    required this.id,
    required this.imageId,
    required this.subId,
    required this.value,
    required this.countryCode,
  });

  factory VoteSingleImageResponse.fromJson(Map<String, dynamic> json) =>
      VoteSingleImageResponse(
        message: json["message"],
        id: json["id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        value: json["value"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
        "image_id": imageId,
        "sub_id": subId,
        "value": value,
        "country_code": countryCode,
      };
}
