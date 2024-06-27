import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class SocialComponant extends StatelessWidget {
  final String svgString;
  final void Function()? onTap;
  final Color color;
  const SocialComponant({
    super.key,
    required this.svgString,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: PhysicalModel(
        // The color behind the widget
        color: color,
        elevation: AppSize.s10,
        borderRadius:
            BorderRadius.circular(AppSize.s12), // Optional: Add border radius
        shadowColor: ColorManager.black, // Optional: Customize the shadow color
        child: GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(svgString),
        ),
      ),
    );
  }
}
