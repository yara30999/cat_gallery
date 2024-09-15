import 'package:flutter/material.dart';
import '../../../../resources/platform_manager.dart';
import 'votes_view_body_desktop.dart';
import 'votes_view_body_mobile.dart';
import 'votes_view_body_tablet.dart';

class VotesViewBody extends StatelessWidget {
  const VotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => const VotesViewBodyMobile(),
      tabletLayout: (context) => const VotesViewBodyTablet(),
      desktopLayout: (context) => const VotesViewBodyDesktop(),
    );
  }
}
