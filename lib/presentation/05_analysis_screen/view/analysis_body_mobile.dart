import 'package:flutter/material.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/analysis_header.dart';
import 'widgets/analysis_section_mobile.dart';

class AnalysisBodyMobile extends StatelessWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBodyMobile({
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
              horizontal: AppPadding.p16, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AnalysisHeader(
              firstStyle: Styles.style18Medium(),
              secondStyle: Styles.style14Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AnalysisSectionMobile(),
          ),
        ),
      ],
    );
  }
}
