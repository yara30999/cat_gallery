import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';

class AddImageHeader extends StatelessWidget {
  const AddImageHeader(
      {super.key, required this.firstStyle, required this.secondStyle});
  final TextStyle firstStyle;
  final TextStyle secondStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.upload_image,
            style: firstStyle,
          ),
        ),
        Text(
          S.current.remember,
          style: secondStyle.copyWith(
            color: ColorManager.red,
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
