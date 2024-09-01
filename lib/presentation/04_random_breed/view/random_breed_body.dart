import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'random_breed_body_desktop.dart';
import 'random_breed_body_mobile.dart';
import 'random_breed_body_tablet.dart';

class RandomBreedBody extends StatelessWidget {
  const RandomBreedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const RandomBreedBodyMobile(),
      tabletLayout: (context) => const RandomBreedBodyTablet(),
      desktopLayout: (context) => const RandomBreedBodyDesktop(),
    );
  }
}
