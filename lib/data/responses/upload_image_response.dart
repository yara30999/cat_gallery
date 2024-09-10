// To parse this JSON data, do
//
//     final uploadImageResponse = uploadImageResponseFromJson(jsonString);

import 'dart:convert';

UploadImageResponse uploadImageResponseFromJson(String str) =>
    UploadImageResponse.fromJson(json.decode(str));

String uploadImageResponseToJson(UploadImageResponse data) =>
    json.encode(data.toJson());

class UploadImageResponse {
  final String id;
  final String url;
  final String subId;
  final int width;
  final int height;
  final String originalFilename;
  final String? breedIds;
  final int pending;
  final int approved;

  UploadImageResponse({
    required this.id,
    required this.url,
    required this.subId,
    required this.width,
    required this.height,
    required this.originalFilename,
    this.breedIds,
    required this.pending,
    required this.approved,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      UploadImageResponse(
        id: json["id"],
        url: json["url"],
        subId: json["sub_id"],
        width: json["width"],
        height: json["height"],
        originalFilename: json["original_filename"],
        breedIds: json["breed_ids"],
        pending: json["pending"],
        approved: json["approved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "sub_id": subId,
        "width": width,
        "height": height,
        "original_filename": originalFilename,
        "breed_ids": breedIds,
        "pending": pending,
        "approved": approved,
      };
}
