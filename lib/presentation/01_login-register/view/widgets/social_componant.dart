import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialComponant extends StatelessWidget {
  final String svgString;
  final void Function()? onTap;

  const SocialComponant({
    super.key,
    required this.svgString,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Material(
          color: Colors.transparent,
          child: SvgPicture.asset(svgString),
        ),
      ),
    );
  }
}
