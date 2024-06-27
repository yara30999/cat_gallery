import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart' as intl_phone;
import '../../../../app/constants.dart';
import '../../../../app/di.dart';
import '../../../../app/extensions.dart';
import '../../../../data/special_sevices/validation_service.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_phone_form_field.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_text_row.dart';
import '../widgets/or_continue_with.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  intl_phone.PhoneNumber? phoneNum;
  String _countryCode = Constants.initialCountryCode;
  String _countryISOCode = Constants.initialCountryISO;
  late TextEditingController _phoneController;

  Gender? selectedGender;

  List<DropdownMenuItem<Gender>> genderItems =
      Gender.values.map((Gender gender) {
    return DropdownMenuItem<Gender>(
      value: gender,
      child: Text(gender.displayValue),
    );
  }).toList();

  final _formKey = GlobalKey<FormState>();
  final _validationService = instance<IValidationService>();

  @override
  void initState() {
    super.initState();
    initPhoneController();
  }

  void initPhoneController() {
    _phoneController = TextEditingController(text: _countryCode);
    /* Listen to changes and control input
        prevent the initial value in text field from being erased.
    */
    _phoneController.addListener(() {
      final text = _phoneController.text;
      if (!text.startsWith(_countryCode)) {
        _phoneController.value = _phoneController.value.copyWith(
          text: _countryCode,
          selection: TextSelection.collapsed(offset: _countryCode.length),
        );
      } else if (_phoneController.selection.start < _countryCode.length) {
        _phoneController.selection =
            TextSelection.collapsed(offset: _countryCode.length);
      }
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppPadding.p16,
          left: AppPadding.p16,
          //for the opening keyboard
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .03,
              ),
              Center(
                child: Text(
                  S.current.createAccount,
                  style: Styles.style30Bold(context,
                      englishFontFamily: FontConstants.font2CormorantInfant),
                ),
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              CustomTextField(
                label: S.current.usernameLabel,
                inputType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextField(
                label: S.current.emailLabel,
                inputType: TextInputType.emailAddress,
                textDirection: TextDirection.ltr,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextField(
                label: S.current.passwordLabel,
                inputType: TextInputType.visiblePassword,
                textDirection: TextDirection.ltr,
                isObscure: isObscurePassword,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                suffixIcon: IconButton(
                    icon: Icon(
                      isObscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorManager.brown2,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    }),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextField(
                label: S.current.passwordConfirmLabel,
                inputType: TextInputType.visiblePassword,
                textDirection: TextDirection.ltr,
                isObscure: isObscureConfirmPassword,
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                customValidator: (value) {
                  return _validationService.validateConfirmPassword(
                      value, password);
                },
                suffixIcon: IconButton(
                    icon: Icon(
                      isObscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorManager.brown2,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscureConfirmPassword = !isObscureConfirmPassword;
                      });
                    }),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              /* from country_code_picker: ^3.0.0
                   and Phone obj come from intl_phone_field: ^3.1.0 */
              PhoneFormField(
                countryCode: _countryCode,
                countryISOCode: _countryISOCode,
                controller: _phoneController,
                onCountryChanged: (country) {
                  setState(() {
                    _countryCode = country.dialCode!;
                    _countryISOCode = country.code!;
                    _phoneController.text = _countryCode;
                  });
                },
                onPhoneNumberChanged: (value) {
                  setState(() {
                    phoneNum = intl_phone.PhoneNumber(
                      countryISOCode: _countryISOCode, //'EG' only 2 digits
                      countryCode: _countryCode, // +20
                      number: value
                          .replaceFirstMapped(_countryCode, (m) => '')
                          .trim(),
                    );
                  });
                },
                validator: (value) {
                  return _validationService.validatePhoneNumber(phoneNum);
                },
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              DropdownButtonFormField<Gender>(
                value: selectedGender,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).iconTheme.color,
                ),
                decoration: InputDecoration(
                  labelText: S.current.selectGender,
                ),
                items: genderItems,
                onChanged: (Gender? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  }
                },
                validator: (Gender? gender) {
                  return _validationService.validateGenderSelection(gender);
                },
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              //register button
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .06 < AppSize.s40
                    ? AppSize.s40
                    : MediaQuery.sizeOf(context).height * .06,
                width: double.infinity,
                child: CustomButton(
                  //with null in onTap the button is disable
                  onTap: (_formKey.currentState?.validate() ?? false)
                      ? () {}
                      : null,
                  btnTitle: S.current.registerLabel,
                ),
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              OrContinueWith(
                googleOnTap: () {},
                facebookOnTap: () {},
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              CustomTextRow(
                questionTxt: S.current.alreadyHaveAnAccount,
                clickTxt: S.current.loginLabel,
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
