// To parse this JSON data, do
//
//     final successResponse = successResponseFromJson(jsonString);

import 'dart:convert';

SuccessResponse successResponseFromJson(String str) =>
    SuccessResponse.fromJson(json.decode(str));

String successResponseToJson(SuccessResponse data) =>
    json.encode(data.toJson());

class SuccessResponse {
  final String message;

  SuccessResponse({
    required this.message,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
