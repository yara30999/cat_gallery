import 'package:flutter/material.dart';
import 'widgets/on_boarding_body.dart';

class OnBoardingViewDesktop extends StatelessWidget {
  const OnBoardingViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: SizedBox()),
        Expanded(flex: 2, child: OnBoardingBody()),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
