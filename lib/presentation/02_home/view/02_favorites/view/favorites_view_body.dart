import 'package:flutter/material.dart';
import '../../../../resources/platform_manager.dart';
import 'favorites_view_body_desktop.dart';
import 'favorites_view_body_mobile.dart';
import 'favorites_view_body_tablet.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const FavoritesViewBodyMobile(),
      tabletLayout: (context) => const FavoritesViewBodyTablet(),
      desktopLayout: (context) => const FavoritesViewBodyDesktop(),
    );
  }
}
