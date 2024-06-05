import '../../generated/l10n.dart';

abstract class IValidationService {
  String? validateName(String? value);
  String? validatePassword(String? value);
  String? validateConfirmPassword(String? value, String? originalPassword);
  String? validateEmail(String? value);
  String? validateNotEmpty(String? value);
}

class ValidationServiceImpl implements IValidationService {
  @override
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emptyMsg;
    } else if (value.length < 3) {
      return S.current.usernameTooShort;
    } else if (value.length > 20) {
      return S.current.usernameTooLong;
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return S.current.usernameNotValid;
    }
    return null;
  }

  @override
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emptyMsg;
    } else if (!RegExp(r'^.{6,}$').hasMatch(value)) {
      return S.current.passwordNotValid;
    }
    return null;
  }

  @override
  String? validateConfirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return S.current.emptyMsg;
    } else if (!RegExp(r'^.{6,}$').hasMatch(value)) {
      return S.current.passwordNotValid;
    } else if (value != originalPassword) {
      return S.current.passwordsDoNotMatch;
    }
    return null;
  }

  @override
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emptyMsg;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
        .hasMatch(value)) {
      return S.current.emailNotValid;
    }
    return null;
  }

  @override
  String? validateNotEmpty(String? value) {
    return value == null || value.isEmpty ? S.current.emptyMsg : null;
  }
}
