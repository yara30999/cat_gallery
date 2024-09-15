import 'package:flutter/material.dart';
import '../../../../app/functions.dart';
import '../../../resources/color_manager.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final double? iconsSize;

  const ActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.iconsSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color ??
          (isLightTheme(context) ? ColorManager.black : ColorManager.white),
      icon: Icon(icon),
      onPressed: onPressed,
      iconSize: iconsSize,
    );
  }
}
