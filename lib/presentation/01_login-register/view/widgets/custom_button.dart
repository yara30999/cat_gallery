import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.btnTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(
          btnTitle,
          style: Styles.style30Bold(),
        ));
  }
}
