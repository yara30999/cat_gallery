import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

class CustomPasswordField extends StatelessWidget {
  final String? hint, label;
  final bool isVisible;
  final void Function(String)? onChanged;
  final Widget? prefixIcon, suffixIcon;
  final bool? fillColor;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.isVisible,
    required this.onChanged,
    required this.suffixIcon,
    this.hint,
    this.prefixIcon,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isVisible,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.emptyMsg;
        } else {
          return RegExp(r'^.{6,}$').hasMatch(value)
              ? null
              : AppStrings.passwordNotValid;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        filled: fillColor,
        fillColor: ColorManager.brown2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class CustomEmailField extends StatelessWidget {
  final String? hint, label;
  final void Function(String)? onChanged;
  final Widget? prefixIcon, suffixIcon;
  final bool? fillColor;

  const CustomEmailField({
    super.key,
    required this.label,
    required this.onChanged,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.emptyMsg;
        } else {
          return RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)
              ? null
              : AppStrings.emailNotValid;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        filled: fillColor,
        fillColor: ColorManager.brown2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
