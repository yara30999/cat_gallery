class ImageAnalysisEntity {
  List<Label> labels;
  String imageId;
  ImageAnalysisEntity({
    required this.labels,
    required this.imageId,
  });
}

class Label {
  String name;
  double confidence;
  Label({
    required this.name,
    required this.confidence,
  });
}
