import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

typedef ValidatorFunction = String? Function(String?);

abstract class IValidationService {
  String? validatePassword(String? value);
  String? validateEmail(String? value);
  String? validateNotEmpty(String? value);
}

class ValidationServiceImpl implements IValidationService {
  @override
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyMsg;
    } else if (!RegExp(r'^.{6,}$').hasMatch(value)) {
      return AppStrings.passwordNotValid;
    }
    return null;
  }

  @override
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyMsg;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
        .hasMatch(value)) {
      return AppStrings.emailNotValid;
    }
    return null;
  }

  @override
  String? validateNotEmpty(String? value) {
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
  final IValidationService validationService;

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
    required this.validationService,
  });

  ValidatorFunction get _defaultValidator {
    /*
    Directly assigns the appropriate function to the validator property
    without needing an intermediate function call here.
    */
    switch (inputType) {
      case TextInputType.visiblePassword:
        return validationService.validatePassword;
      case TextInputType.emailAddress:
        return validationService.validateEmail;
      default:
        return validationService.validateNotEmpty;
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
