import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'custom_divider_with_text.dart';
import 'social_componant.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/assets_manager.dart';

import '../../../resources/styles_manager.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({
    super.key,
    required this.googleOnTap,
    required this.facebookOnTap,
    this.heightBetweenDividerAndComponants,
  });

  final void Function() googleOnTap;
  final void Function() facebookOnTap;
  final double? heightBetweenDividerAndComponants;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDividerWithText(
          text: Text(
            S.current.orContinueWith,
            style: Styles.style20Regular(),
          ),
        ),
        SizedBox(
          height: heightBetweenDividerAndComponants ?? AppSize.s30,
        ),
        SizedBox(
          height: AppSize.s40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialComponant(
                svgString: SvgAssets.google,
                onTap: googleOnTap,
              ),
              SocialComponant(
                svgString: SvgAssets.facebook,
                onTap: facebookOnTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
