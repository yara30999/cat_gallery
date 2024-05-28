import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

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
          style:
              Styles.textStyle18En1(context).copyWith(color: ColorManager.grey),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            clickTxt,
            style: Styles.textStyle18En1(context)
                .copyWith(color: ColorManager.pink1),
          ),
        )
      ],
    );
  }
}
