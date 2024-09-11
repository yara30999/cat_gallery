import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import '../bloc_builder/analysis_bar_graph_bloc_consumer.dart';
import 'analysis_image.dart';

class AnalysisSectionTablet extends StatelessWidget {
  const AnalysisSectionTablet({super.key});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSize.s14,
      runSpacing: AppSize.s14,
      children: [
        ConstrainedBox(
            constraints: BoxConstraints.fromViewConstraints(
                const ViewConstraints(
                    maxHeight: AppSize.s1200, maxWidth: AppSize.s400)),
            child: const AnalysisImage()),
        const SizedBox(
          height: AppSize.s400,
          width: AppSize.s480,
          child: AnalysisBarGraphBlocConsumer(),
        ),
      ],
    );
  }
}
