import 'package:flutter/material.dart';
import '../../resources/platform_manager.dart';
import 'home_view_desktop.dart';
import 'home_view_mobile.dart';
import 'home_view_tablet.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const HomeViewMobile(),
      tabletLayout: (context) => const HomeViewTablet(),
      desktopLayout: (context) => const HomeViewDesktop(),
    );
  }
}
