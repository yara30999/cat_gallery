import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../domain/entities/image_analysis_entity.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'analysis_image.dart';
import 'analysis_bar_graph.dart';

class AnalysisSectionTablet extends StatelessWidget {
  const AnalysisSectionTablet({super.key});
  ImageAnalysisEntity get dummyImageAnalysis =>
      const ImageAnalysisEntity(labels: [
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
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSize.s14,
      runSpacing: AppSize.s14,
      children: [
        //get the image here using api call...
        ConstrainedBox(
            constraints: BoxConstraints.fromViewConstraints(
                const ViewConstraints(
                    maxHeight: AppSize.s1200, maxWidth: AppSize.s400)),
            // constraints: const BoxConstraints(
            //     maxWidth: AppSize.s500, maxHeight: AppSize.s1200),
            child: const AnalysisImage(
              imgUrl:
                  'https://th.bing.com/th/id/R.0715d6df3995c9154949ab56b207fc6c?rik=wCFaOTOqHCy7YQ&riu=http%3a%2f%2fcdn0.wideopenpets.com%2fwp-content%2fuploads%2f2018%2f02%2fAdobeStock_78698208.jpeg&ehk=cB9mVaBIVQujqA5FUdzgzpM%2fkHHkjGVIoXmPZPAg2kI%3d&risl=&pid=ImgRaw&r=0',
            )),
        SizedBox(
          height: AppSize.s400,
          width: AppSize.s480,
          child: AnalysisBarGraph(
            imageAnalysisEntity: dummyImageAnalysis,
            labelsStyle: Styles.style14Medium(),
          ),
        ),
      ],
    );
  }
}
