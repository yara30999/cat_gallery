import 'package:flutter/material.dart';
import '../../../../resources/platform_manager.dart';
import 'uploads_view_body_desktop.dart';
import 'uploads_view_body_mobile.dart';
import 'uploads_view_body_tablet.dart';

class UploadsViewBody extends StatelessWidget {
  const UploadsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const UploadsViewBodyMobile(),
      tabletLayout: (context) => const UploadsViewBodyTablet(),
      desktopLayout: (context) => const UploadsViewBodyDesktop(),
    );
  }
}
