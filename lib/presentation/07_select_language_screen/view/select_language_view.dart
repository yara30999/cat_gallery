import 'package:flutter/material.dart';
import '../../01_login-register-forgotpass/view/widgets/background_painter.dart';
import '../../resources/platform_manager.dart';
import 'select_language_view_desktop.dart';
import 'select_language_view_mobile.dart';
import 'select_language_view_tablet.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: AdaptiveLayout(
          mobileLayout: (context) => const SelectLanguageViewMobile(),
          tabletLayout: (context) => const SelectLanguageViewTablet(),
          desktopLayout: (context) => const SelectLanguageViewDesktop(),
        ),
      ),
    );
  }
}
