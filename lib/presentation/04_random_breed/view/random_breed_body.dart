import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'random_breed_body_desktop.dart';
import 'random_breed_body_mobile.dart';
import 'random_breed_body_tablet.dart';

class RandomBreedBody extends StatelessWidget {
  final ScrollController? randomBreedScreenScrollController;
  const RandomBreedBody({
    super.key,
    required this.randomBreedScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => RandomBreedBodyMobile(
          randomBreedScreenScrollController: randomBreedScreenScrollController),
      tabletLayout: (context) => RandomBreedBodyTablet(
          randomBreedScreenScrollController: randomBreedScreenScrollController),
      desktopLayout: (context) => RandomBreedBodyDesktop(
          randomBreedScreenScrollController: randomBreedScreenScrollController),
    );
  }
}
