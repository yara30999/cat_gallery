import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../resources/values_manager.dart';
import '../bloc_builder/analysis_bar_graph_bloc_consumer.dart';
import 'analysis_image.dart';

class AnalysisSectionDesktop extends StatelessWidget {
  const AnalysisSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 27,
          child: AnalysisImage(),
        ),
        Spacer(),
        Flexible(
          flex: 14,
          child: AnalysisBarGraphBlocConsumer(
            barWidth: AppSize.s16,
          ),
        ),
      ],
    );
  }
}
