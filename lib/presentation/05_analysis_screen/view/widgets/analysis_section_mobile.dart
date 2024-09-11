import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import '../bloc_builder/analysis_bar_graph_bloc_consumer.dart';
import 'analysis_image.dart';

class AnalysisSectionMobile extends StatelessWidget {
  const AnalysisSectionMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AnalysisImage(),
        SizedBox(
          height: AppSize.s20,
        ),
        AnalysisBarGraphBlocConsumer(),
      ],
    );
  }
}
