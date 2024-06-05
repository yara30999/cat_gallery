import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CusomTextRow extends StatelessWidget {
  final String questionTxt, clickTxt;
  final void Function()? onTap;

  const CusomTextRow({
    super.key,
    required this.questionTxt,
    required this.clickTxt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionTxt,
          style: Styles.style18semiBold(context,
                  englishFontFamily: FontConstants.font1Monserrat)
              .copyWith(color: ColorManager.grey),
        ),
        const SizedBox(
          width: AppSize.s5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            clickTxt,
            style: Styles.style18semiBold(context,
                englishFontFamily: FontConstants.font1Monserrat),
          ),
        )
      ],
    );
  }
}
