import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CustomTextRow extends StatelessWidget {
  final String questionTxt, clickTxt;
  final void Function()? onTap;

  const CustomTextRow({
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
          style: Styles.style18semiBold().copyWith(color: ColorManager.grey1),
        ),
        const SizedBox(
          width: AppSize.s5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            clickTxt,
            style: Styles.style18semiBold(),
          ),
        )
      ],
    );
  }
}
