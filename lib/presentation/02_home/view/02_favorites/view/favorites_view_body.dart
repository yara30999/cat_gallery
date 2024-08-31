import 'package:flutter/material.dart';
import '../../../../resources/platform_manager.dart';
import 'favorites_view_body_desktop.dart';
import 'favorites_view_body_mobile.dart';
import 'favorites_view_body_tablet.dart';

class FavoritesViewBody extends StatelessWidget {
  final ScrollController? favoratesScreenScrollController;
  const FavoritesViewBody(
      {super.key, required this.favoratesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => FavoritesViewBodyMobile(
          favoratesScreenScrollController: favoratesScreenScrollController),
      tabletLayout: (context) => FavoritesViewBodyTablet(
          favoratesScreenScrollController: favoratesScreenScrollController),
      desktopLayout: (context) => FavoritesViewBodyDesktop(
          favoratesScreenScrollController: favoratesScreenScrollController),
    );
  }
}
