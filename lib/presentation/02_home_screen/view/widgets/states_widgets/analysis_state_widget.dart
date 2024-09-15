import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/values_manager.dart';

class AnalysisStateWidget extends StatelessWidget {
  const AnalysisStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSize.s20,
        ),
        child: AspectRatio(
          aspectRatio: 1 / 1.2,
          child: Lottie.asset(JsonAssets.analysis,
              fit: BoxFit.contain, width: double.infinity),
        ),
      ),
    );
  }
}
