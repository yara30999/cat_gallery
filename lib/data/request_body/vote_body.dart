// To parse this JSON data, do
//
//     final voteBody = voteBodyFromJson(jsonString);

import 'dart:convert';

VoteBody voteBodyFromJson(String str) => VoteBody.fromJson(json.decode(str));

String voteBodyToJson(VoteBody data) => json.encode(data.toJson());

class VoteBody {
  final String imageId;
  final String subId;
  final int value;

  VoteBody({
    required this.imageId,
    required this.subId,
    required this.value,
  });

  factory VoteBody.fromJson(Map<String, dynamic> json) => VoteBody(
        imageId: json["image_id"],
        subId: json["sub_id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "sub_id": subId,
        "value": value,
      };
}
