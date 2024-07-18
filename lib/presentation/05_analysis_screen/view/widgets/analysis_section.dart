import 'package:flutter/material.dart';
import '../../../../domain/entities/image_analysis_entity.dart';
import '../../../resources/values_manager.dart';
import 'analysis_image.dart';
import 'analysis_bar_graph.dart';

class AnalysisSection extends StatelessWidget {
  const AnalysisSection({super.key});
  ImageAnalysisEntity get dummyImageAnalysis => ImageAnalysisEntity(labels: [
        Label(name: 'Animal', confidence: 99.23681640625),
        Label(name: 'Mammal', confidence: 99.23681640625),
        Label(name: 'Rat', confidence: 99.23681640625),
        Label(name: 'Cat', confidence: 94.15872192382812),
        Label(name: 'Pet', confidence: 94.15872192382812),
        Label(name: 'Kitten', confidence: 84.81489562988281),
        Label(name: 'Head', confidence: 57.13328552246094),
        Label(name: 'Snout', confidence: 56.83573532104492),
        Label(name: 'Abyssinian', confidence: 55.87989044189453),
        Label(name: 'Face', confidence: 54.641197204589844),
      ], imageId: '0XYvRd7oD');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //get the image here using api call...
        const AnalysisImage(),
        const SizedBox(
          height: AppSize.s20,
        ),
        AnalysisBarGraph(
          imageAnalysisEntity: dummyImageAnalysis,
        ),
      ],
    );
  }
}
