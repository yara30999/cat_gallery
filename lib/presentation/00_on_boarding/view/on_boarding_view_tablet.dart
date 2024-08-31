import 'package:flutter/material.dart';
import 'widgets/on_boarding_body.dart';

class OnBoardingViewTablet extends StatelessWidget {
  const OnBoardingViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: OnBoardingBody()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
