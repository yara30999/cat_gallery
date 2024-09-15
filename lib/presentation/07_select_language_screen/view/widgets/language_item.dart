import 'package:flutter/material.dart';
import 'active_inactive_container.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({super.key, required this.name, required this.isActive});

  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      firstChild: ActiveContainer(label: name),
      secondChild: InActiveContainer(label: name),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
