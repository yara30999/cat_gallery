import 'package:flutter/material.dart';
import '../../02_home/widgets/persistenet_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/analysis_header.dart';
import 'widgets/analysis_section_desktop.dart';

class AnalysisBodyDesktop extends StatelessWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBodyDesktop({
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
              horizontal: AppPadding.p60, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AnalysisHeader(
              firstStyle: Styles.style36Medium(),
              secondStyle: Styles.style20Regular(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p40,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AnalysisSectionDesktop(),
          ),
        ),
      ],
    );
  }
}
