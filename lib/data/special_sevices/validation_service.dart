import '../../presentation/resources/strings_manager.dart';

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
