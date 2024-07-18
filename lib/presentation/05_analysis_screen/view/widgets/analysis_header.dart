import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';

class AnalysisHeader extends StatelessWidget {
  const AnalysisHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.image_analysis,
            style: Styles.style36Medium(),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.we_are_using_AWS_Rekognition,
            style: Styles.style20Regular(),
          ),
        ),
      ],
    );
  }
}
