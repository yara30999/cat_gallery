import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        elevation: 10.0,
        borderRadius:
            BorderRadius.circular(12.0), // Optional: Add border radius
        shadowColor: Colors.black, // Optional: Customize the shadow color
        child: GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(svgString),
        ),
      ),
    );
  }
}
