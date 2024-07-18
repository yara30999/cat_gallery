class ImageAnalysisEntity {
  final List<Label> labels;
  final String imageId;
  const ImageAnalysisEntity({
    required this.labels,
    required this.imageId,
  });
}

class Label {
  final String name;
  final double confidence;
  const Label({
    required this.name,
    required this.confidence,
  });
}
