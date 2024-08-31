import 'package:flutter/material.dart';
import '../../../../resources/platform_manager.dart';
import 'uploads_view_body_desktop.dart';
import 'uploads_view_body_mobile.dart';
import 'uploads_view_body_tablet.dart';

class UploadsViewBody extends StatelessWidget {
  final ScrollController? uploadsScreenScrollController;
  const UploadsViewBody(
      {super.key, required this.uploadsScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => UploadsViewBodyMobile(
          uploadsScreenScrollController: uploadsScreenScrollController),
      tabletLayout: (context) => UploadsViewBodyTablet(
          uploadsScreenScrollController: uploadsScreenScrollController),
      desktopLayout: (context) => UploadsViewBodyDesktop(
          uploadsScreenScrollController: uploadsScreenScrollController),
    );
  }
}
