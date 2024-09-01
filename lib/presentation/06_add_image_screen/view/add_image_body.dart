import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'add_image_body_desktop.dart';
import 'add_image_body_mobile.dart';
import 'add_image_body_tablet.dart';

class AddImageBody extends StatelessWidget {
  const AddImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const AddImageBodyMobile(),
      tabletLayout: (context) => const AddImageBodyTablet(),
      desktopLayout: (context) => const AddImageBodyDesktop(),
    );
  }
}
