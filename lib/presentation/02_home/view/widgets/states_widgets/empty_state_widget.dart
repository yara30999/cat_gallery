import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/styles_manager.dart';

class EmptyStateWidget extends StatelessWidget {
  final String text;
  const EmptyStateWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(JsonAssets.empty3,
            fit: BoxFit.contain, width: double.infinity),
        Text(
          text,
          style: Styles.style18Medium(),
        ),
      ],
    );
  }
}
