import 'package:intl_phone_field/phone_number.dart' as intl_phone;
import '../../app/di.dart';
import '../../generated/l10n.dart';
import 'country_service.dart';

abstract class IValidationService {
  String? validateName(String? value);
  String? validatePassword(String? value);
  String? validateConfirmPassword(String? value, String? originalPassword);
  String? validateEmail(String? value);
  String? validateNotEmpty(String? value);
  String? validatePhoneNumber(intl_phone.PhoneNumber? phone);
}

class ValidationServiceImpl implements IValidationService {
  static final countryDataService = instance<ICountryDataService>();
  @override
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emptyMsg;
    } else if (value.length < 3) {
      return S.current.usernameTooShort;
    } else if (value.length > 20) {
      return S.current.usernameTooLong;
    } else if (!RegExp(r'^[\p{L}0-9_]+$', unicode: true).hasMatch(value)) {
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

  @override
  String? validatePhoneNumber(intl_phone.PhoneNumber? phone) {
    if (phone == null || phone.number.isEmpty) {
      return S.current.phone_number_is_required;
    } else if (!RegExp(r'^\d+$').hasMatch(phone.number)) {
      return S.current.please_enter_a_valid_phone_number;
    }
    // Find the Country length that matches the ISOCode
    int? maxLength =
        countryDataService.findMaxLengthByISOCode(phone.countryISOCode);
    int? minLength =
        countryDataService.findMinLengthByISOCode(phone.countryISOCode);
    if (maxLength != null && minLength != null) {
      // Validate length based on the found Country length
      int liveLength = phone.number.length;
      if (liveLength < minLength || liveLength > maxLength) {
        return S.current.phone_number_length_invalid;
      }
    } else {
      // Handle case where no matching CountryData is found (unlikely with complete data)
      return S.current.country_number_length_not_found;
    }
    return null; // Return null if validation passes
  }
}
