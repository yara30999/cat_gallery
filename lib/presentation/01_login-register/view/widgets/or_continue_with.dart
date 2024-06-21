import 'package:flutter/material.dart';
import 'custom_divider_with_text.dart';
import 'social_componant.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
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
            style: Styles.style20Bold(context,
                englishFontFamily: FontConstants.font2CormorantInfant),
          ),
        ),
        SizedBox(
          height: heightBetweenDividerAndComponants ?? 30.0,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialComponant(
                svgString: SvgAssets.google,
                onTap: googleOnTap,
                color: ColorManager.brown2,
              ),
              SocialComponant(
                svgString: SvgAssets.facebook,
                onTap: facebookOnTap,
                color: ColorManager.brown2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
