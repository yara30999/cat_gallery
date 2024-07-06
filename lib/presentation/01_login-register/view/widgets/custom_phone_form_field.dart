import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../../../app/di.dart';
import '../../../../data/special_sevices/country_service.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/conistants_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class PhoneFormField extends StatelessWidget {
  final String countryCode;
  final String countryISOCode;
  final TextEditingController controller;
  final ValueChanged<CountryCode> onCountryChanged;
  final ValueChanged<String> onPhoneNumberChanged;
  final FormFieldValidator<String>? validator;

  const PhoneFormField({
    super.key,
    required this.countryCode,
    required this.countryISOCode,
    required this.controller,
    required this.onCountryChanged,
    required this.onPhoneNumberChanged,
    this.validator,
  });

  static final countryDataService = instance<ICountryDataService>();

  int calcLength() {
    int characterLength =
        ((countryDataService.findMaxLengthByISOCode(countryISOCode) ?? 0) +
            countryCode.length);
    return characterLength;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: calcLength(),
      textDirection: TextDirection.ltr,
      keyboardType: TextInputType.phone,
      onChanged: onPhoneNumberChanged,
      validator: validator,
      style: Styles.style18Medium(context),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.s20, vertical: AppSize.s0),
        hintText: S.current.do_not_type_country_code_again,
        hintStyle: Styles.style18Medium(context),
        errorStyle:
            Styles.style14Medium(context).copyWith(color: ColorManager.red),
        prefixIcon: Padding(
          padding: (LocalizationUtils.currentLocalIsAr())
              ? const EdgeInsets.only(right: 0)
              : const EdgeInsets.only(right: AppPadding.p10),
          child: Container(
            decoration: BoxDecoration(
              border: (LocalizationUtils.currentLocalIsAr())
                  ? Border(
                      left: BorderSide(
                          width: AppSize.s2,
                          color: Theme.of(context).primaryColorDark),
                    )
                  : Border(
                      right: BorderSide(
                          width: AppSize.s2,
                          color: Theme.of(context).primaryColorDark),
                    ),
            ),
            child: CountryCodePicker(
              onChanged: onCountryChanged,
              initialSelection: countryISOCode,
              favorite: AppConstants.favoriteCountries,
              showCountryOnly: true,
              hideMainText: true,
              showOnlyCountryWhenClosed: false,
              dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
