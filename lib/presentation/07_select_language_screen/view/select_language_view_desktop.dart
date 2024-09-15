import 'package:flutter/material.dart';
import 'widgets/select_language_body.dart';

class SelectLanguageViewDesktop extends StatelessWidget {
  const SelectLanguageViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: SizedBox()),
        Expanded(flex: 2, child: SelectLanguageBody()),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
