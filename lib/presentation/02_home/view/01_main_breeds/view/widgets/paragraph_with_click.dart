import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/functions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';

class ParagraphStartsWithClickText extends StatelessWidget {
  const ParagraphStartsWithClickText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle baseTextStyle = Styles.style18Medium().copyWith(
        color: isLightTheme(context) ? ColorManager.black : ColorManager.white);
    return RichText(
        text: TextSpan(style: baseTextStyle, children: [
      TextSpan(
        text: S.current.Browse_random_images_of_all_breeds,
        style: baseTextStyle.copyWith(
          color: ColorManager.blue,
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.blue, // Custom underline color
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: AppSize.s2,
        ),
        mouseCursor: SystemMouseCursors.click,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushNamed(
              context,
              Routes.randomBreedRoute,
            );
          },
      ),
      TextSpan(
        text: S.current.main_breed_paragraph,
      ),
    ]));
  }
}
