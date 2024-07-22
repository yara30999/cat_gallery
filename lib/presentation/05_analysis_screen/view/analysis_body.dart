import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'analysis_body_desktop.dart';
import 'analysis_body_mobile.dart';
import 'analysis_body_tablet.dart';

class AnalysisBody extends StatelessWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBody({
    super.key,
    required this.analysisScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => AnalysisBodyMobile(
          analysisScreenScrollController: analysisScreenScrollController),
      tabletLayout: (context) => AnalysisBodyTablet(
          analysisScreenScrollController: analysisScreenScrollController),
      desktopLayout: (context) => AnalysisBodyDesktop(
          analysisScreenScrollController: analysisScreenScrollController),
    );
  }
}
