import 'package:flutter/material.dart';
import '../../02_home/widgets/persistenet_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/analysis_header.dart';
import 'widgets/analysis_section_tablet.dart';

class AnalysisBodyTablet extends StatelessWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBodyTablet({
    super.key,
    required this.analysisScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: analysisScreenScrollController,
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p40, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AnalysisHeader(
              firstStyle: Styles.style22Medium(),
              secondStyle: Styles.style16Regular(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AnalysisSectionTablet(),
          ),
        ),
      ],
    );
  }
}
