import 'package:flutter/material.dart';
import '../../../resources/platform_manager.dart';
import 'main_breed_body_desktop.dart';
import 'main_breed_body_mobile.dart';
import 'main_breed_body_tablet.dart';

class MainBreedsBody extends StatelessWidget {
  final ScrollController? mainBreedsScreenScrollController;
  const MainBreedsBody({
    super.key,
    required this.mainBreedsScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => MainBreedsBodyMobile(
          mainBreedsScreenScrollController: mainBreedsScreenScrollController),
      tabletLayout: (context) => MainBreedsBodyTablet(
          mainBreedsScreenScrollController: mainBreedsScreenScrollController),
      desktopLayout: (context) => MainBreedsBodyDesktop(
          mainBreedsScreenScrollController: mainBreedsScreenScrollController),
    );
  }
}
