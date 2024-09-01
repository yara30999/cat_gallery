import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'analysis_body_desktop.dart';
import 'analysis_body_mobile.dart';
import 'analysis_body_tablet.dart';

class AnalysisBody extends StatelessWidget {
  const AnalysisBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const AnalysisBodyMobile(),
      tabletLayout: (context) => const AnalysisBodyTablet(),
      desktopLayout: (context) => const AnalysisBodyDesktop(),
    );
  }
}
