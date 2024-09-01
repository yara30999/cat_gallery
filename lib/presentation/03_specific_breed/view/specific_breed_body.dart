import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'specific_breed_body_desktop.dart';
import 'specific_breed_body_mobile.dart';
import 'specific_breed_body_tablet.dart';

class SpecificBreedBody extends StatelessWidget {
  const SpecificBreedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const SpecificBreedBodyMobile(),
      tabletLayout: (context) => const SpecificBreedBodyTablet(),
      desktopLayout: (context) => const SpecificBreedBodyDesktop(),
    );
  }
}
