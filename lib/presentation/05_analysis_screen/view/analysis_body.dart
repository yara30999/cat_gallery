import 'package:flutter/material.dart';
import '../../02_home/widgets/custom_app_bar.dart';
import '../../resources/values_manager.dart';
import 'widgets/analysis_header.dart';
import 'widgets/analysis_section.dart';

class AnalysisBody extends StatelessWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBody({
    super.key,
    required this.analysisScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: analysisScreenScrollController,
      slivers: const [
        PersistentAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p10),
          sliver: SliverToBoxAdapter(
            child: AnalysisHeader(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AnalysisSection(),
          ),
        ),
      ],
    );
  }
}
