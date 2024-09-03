import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/styles_manager.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorText;
  const ErrorStateWidget({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(JsonAssets.error, fit: BoxFit.contain),
        Text(
          errorText,
          style: Styles.style18Medium(),
        ),
      ],
    );
  }
}
