import 'package:flutter/material.dart';
import 'widgets/select_language_body.dart';

class SelectLanguageViewTablet extends StatelessWidget {
  const SelectLanguageViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: SelectLanguageBody()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
