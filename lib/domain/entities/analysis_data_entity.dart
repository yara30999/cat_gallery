import 'image_analysis_entity.dart';
import 'measurement_data_entity.dart';

class AnalysisDataEntity {
  final ImageAnalysisEntity imageAnalysisEntity;

  final List<IndividualMeasurementBar> analysisDataBars;
  //must be in the same order of the measurementDataBars
  //in separate get method to rebuild when the locals changes
  List<String> get labels => imageAnalysisEntity.labels.map((e) {
        return e.name;
      }).toList();

  AnalysisDataEntity({
    required this.imageAnalysisEntity,
  }) : analysisDataBars =
            imageAnalysisEntity.labels.asMap().entries.map((entry) {
          int index = entry.key;
          var e = entry.value;
          return IndividualMeasurementBar(x: index + 1, y: e.confidence);
        }).toList();
}
