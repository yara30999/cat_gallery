// To parse this JSON data, do
//
//     final getUploadsResponse = getUploadsResponseFromJson(jsonString);

import 'dart:convert';
import 'breeds_response.dart';
import 'cat_with_click_response.dart';

List<GetUploadsResponse> getUploadsResponseFromJson(String str) =>
    List<GetUploadsResponse>.from(
        json.decode(str).map((x) => GetUploadsResponse.fromJson(x)));

String getUploadsResponseToJson(List<GetUploadsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUploadsResponse {
  final List<BreedResponse> breeds;
  final List<CategoryResponse>? categories;
  final String id;
  final String url;
  final int width;
  final int height;
  final String subId;
  final DateTime createdAt;
  final String originalFilename;
  final String? breedIds;

  GetUploadsResponse({
    required this.breeds,
    this.categories,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.subId,
    required this.createdAt,
    required this.originalFilename,
    required this.breedIds,
  });

  GetUploadsResponse copyWith({
    List<BreedResponse>? breeds,
    List<CategoryResponse>? categories,
  }) =>
      GetUploadsResponse(
        breeds: breeds ?? this.breeds,
        categories: categories ?? this.categories,
        id: id,
        url: url,
        width: width,
        height: height,
        subId: subId,
        createdAt: createdAt,
        originalFilename: originalFilename,
        breedIds: breedIds,
      );

  factory GetUploadsResponse.fromJson(Map<String, dynamic> json) =>
      GetUploadsResponse(
        breeds: List<BreedResponse>.from(
            json["breeds"].map((x) => BreedResponse.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<CategoryResponse>.from(
                json["categories"]!.map((x) => CategoryResponse.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        originalFilename: json["original_filename"],
        breedIds: json["breed_ids"],
      );

  Map<String, dynamic> toJson() => {
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width,
        "height": height,
        "sub_id": subId,
        "created_at": createdAt.toIso8601String(),
        "original_filename": originalFilename,
        "breed_ids": breedIds,
      };
}
