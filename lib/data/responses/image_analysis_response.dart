// To parse this JSON data, do
//
//     final imageAnalysisResponse = imageAnalysisResponseFromJson(jsonString);

import 'dart:convert';

List<ImageAnalysisResponse> imageAnalysisResponseFromJson(String str) =>
    List<ImageAnalysisResponse>.from(
        json.decode(str).map((x) => ImageAnalysisResponse.fromJson(x)));

String imageAnalysisResponseToJson(List<ImageAnalysisResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageAnalysisResponse {
  final List<LabelResponse> labels;
  final List<dynamic> moderationLabels;
  final String vendor;
  final String imageId;
  final DateTime createdAt;

  ImageAnalysisResponse({
    required this.labels,
    required this.moderationLabels,
    required this.vendor,
    required this.imageId,
    required this.createdAt,
  });

  factory ImageAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      ImageAnalysisResponse(
        labels: List<LabelResponse>.from(
            json["labels"].map((x) => LabelResponse.fromJson(x))),
        moderationLabels:
            List<dynamic>.from(json["moderation_labels"].map((x) => x)),
        vendor: json["vendor"],
        imageId: json["image_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "moderation_labels": List<dynamic>.from(moderationLabels.map((x) => x)),
        "vendor": vendor,
        "image_id": imageId,
        "created_at": createdAt.toIso8601String(),
      };
}

class LabelResponse {
  final String name;
  final double confidence;
  final List<Instance>? instances;
  final List<Parent>? parents;

  LabelResponse({
    required this.name,
    required this.confidence,
    this.instances,
    this.parents,
  });

  factory LabelResponse.fromJson(Map<String, dynamic> json) => LabelResponse(
        name: json["Name"],
        confidence: json["Confidence"]?.toDouble(),
        instances: json["Instances"] == null
            ? []
            : List<Instance>.from(
                json["Instances"]!.map((x) => Instance.fromJson(x))),
        parents: json["Parents"] == null
            ? []
            : List<Parent>.from(
                json["Parents"]!.map((x) => Parent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Confidence": confidence,
        "Instances": instances == null
            ? []
            : List<dynamic>.from(instances!.map((x) => x.toJson())),
        "Parents": parents == null
            ? []
            : List<dynamic>.from(parents!.map((x) => x.toJson())),
      };
}

class Instance {
  final BoundingBox boundingBox;
  final double confidence;

  Instance({
    required this.boundingBox,
    required this.confidence,
  });

  factory Instance.fromJson(Map<String, dynamic> json) => Instance(
        boundingBox: BoundingBox.fromJson(json["BoundingBox"]),
        confidence: json["Confidence"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "BoundingBox": boundingBox.toJson(),
        "Confidence": confidence,
      };
}

class BoundingBox {
  final double width;
  final double height;
  final double left;
  final double top;

  BoundingBox({
    required this.width,
    required this.height,
    required this.left,
    required this.top,
  });

  factory BoundingBox.fromJson(Map<String, dynamic> json) => BoundingBox(
        width: json["Width"]?.toDouble(),
        height: json["Height"]?.toDouble(),
        left: json["Left"]?.toDouble(),
        top: json["Top"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Width": width,
        "Height": height,
        "Left": left,
        "Top": top,
      };
}

class Parent {
  final String name;

  Parent({
    required this.name,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
      };
}
