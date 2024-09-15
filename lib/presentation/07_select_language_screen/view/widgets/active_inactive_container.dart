import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class ActiveContainer extends StatelessWidget {
  final String label;
  const ActiveContainer({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary5,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      height: AppSize.s45,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            label,
            style: Styles.style16Medium().copyWith(color: ColorManager.black),
          ),
          const Icon(
            Icons.check,
            color: ColorManager.black,
          )
        ],
      ),
    );
  }
}

class InActiveContainer extends StatelessWidget {
  final String label;
  const InActiveContainer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary5,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      height: AppSize.s45,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            label,
            style: Styles.style16Medium().copyWith(color: ColorManager.black),
          ),
          const Icon(
            Icons.check,
            color: ColorManager.primary5,
          )
        ],
      ),
    );
  }
}
