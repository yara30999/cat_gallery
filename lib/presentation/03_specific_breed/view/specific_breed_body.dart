import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'specific_breed_body_desktop.dart';
import 'specific_breed_body_mobile.dart';
import 'specific_breed_body_tablet.dart';

class SpecificBreedBody extends StatelessWidget {
  final ScrollController? specificBreedScreenScrollController;
  const SpecificBreedBody({
    super.key,
    required this.specificBreedScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => SpecificBreedBodyMobile(
          specificBreedScreenScrollController:
              specificBreedScreenScrollController),
      tabletLayout: (context) => SpecificBreedBodyTablet(
          specificBreedScreenScrollController:
              specificBreedScreenScrollController),
      desktopLayout: (context) => SpecificBreedBodyDesktop(
          specificBreedScreenScrollController:
              specificBreedScreenScrollController),
    );
  }
}
