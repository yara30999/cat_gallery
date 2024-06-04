import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

typedef ValidatorFunction = String? Function(String?);

class Validators {
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyMsg;
    } else {
      return RegExp(r'^.{6,}$').hasMatch(value)
          ? null
          : AppStrings.passwordNotValid;
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyMsg;
    } else {
      return RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)
          ? null
          : AppStrings.emailNotValid;
    }
  }

  static String? validateNotEmpty(String? value) {
    return value == null || value.isEmpty ? AppStrings.emptyMsg : null;
  }
}

class CustomTextField extends StatelessWidget {
  final String? hint, label;
  final bool isObscure;
  final void Function(String)? onChanged;
  final Widget? prefixIcon, suffixIcon;
  final bool? fillColor;
  final TextInputType inputType;
  final ValidatorFunction? customValidator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.inputType,
    required this.onChanged,
    this.isObscure = false,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.customValidator,
  });

  ValidatorFunction get _defaultValidator {
    switch (inputType) {
      case TextInputType.visiblePassword:
        return Validators.validatePassword;
      case TextInputType.emailAddress:
        return Validators.validateEmail;
      default:
        return Validators.validateNotEmpty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      keyboardType: inputType,
      validator: customValidator ?? _defaultValidator,
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
