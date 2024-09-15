class ImageAnalysisEntity {
  final List<Label> labels;
  final String imageId;
  const ImageAnalysisEntity({
    required this.labels,
    required this.imageId,
  });

  ImageAnalysisEntity copyWith({
    List<Label>? labels,
  }) =>
      ImageAnalysisEntity(
        labels: labels ?? this.labels,
        imageId: imageId,
      );
}

class Label {
  final String name;
  final double confidence;
  const Label({
    required this.name,
    required this.confidence,
  });

  Label copyWith({
    String? name,
  }) =>
      Label(
        name: name ?? this.name,
        confidence: confidence,
      );
}
