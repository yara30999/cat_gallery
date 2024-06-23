import 'package:flutter/material.dart';
import '../../../../app/di.dart';
import '../../../../app/types_definitions.dart';
import '../../../../data/special_sevices/validation_service.dart';
import '../../../resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String? hint, label;
  final bool isObscure;
  final void Function(String)? onChanged;
  final Widget? prefixIcon, suffixIcon;
  final bool? fillColor;
  final TextInputType inputType;
  final ValidatorFunction? customValidator;
  final TextDirection? textDirection;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.inputType,
      required this.onChanged,
      this.isObscure = false,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor,
      this.customValidator,
      this.textDirection});

  static final validationService = instance<IValidationService>();

  ValidatorFunction get _defaultValidator {
    /*
    Directly assigns the appropriate function to the validator property
    without needing an intermediate function call here.
    */
    switch (inputType) {
      case TextInputType.name:
        return validationService.validateName;
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
      textDirection: textDirection,
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
