import 'package:flutter/material.dart';
import '../../../../resources/platform_manager.dart';
import 'votes_view_body_desktop.dart';
import 'votes_view_body_mobile.dart';
import 'votes_view_body_tablet.dart';

class VotesViewBody extends StatelessWidget {
  final ScrollController? votesScreenScrollController;
  const VotesViewBody({super.key, required this.votesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return MiniAdaptiveLayout(
      mobileLayout: (context) => VotesViewBodyMobile(
          votesScreenScrollController: votesScreenScrollController),
      tabletLayout: (context) => VotesViewBodyTablet(
          votesScreenScrollController: votesScreenScrollController),
      desktopLayout: (context) => VotesViewBodyDesktop(
          votesScreenScrollController: votesScreenScrollController),
    );
  }
}
