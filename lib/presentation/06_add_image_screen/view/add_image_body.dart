import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'add_image_body_desktop.dart';
import 'add_image_body_mobile.dart';
import 'add_image_body_tablet.dart';

class AddImageBody extends StatelessWidget {
  final ScrollController? addImageScreenScrollController;
  const AddImageBody({super.key, this.addImageScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => AddImageBodyMobile(
          addImageScreenScrollController: addImageScreenScrollController),
      tabletLayout: (context) => AddImageBodyTablet(
          addImageScreenScrollController: addImageScreenScrollController),
      desktopLayout: (context) => AddImageBodyDesktop(
          addImageScreenScrollController: addImageScreenScrollController),
    );
  }
}
