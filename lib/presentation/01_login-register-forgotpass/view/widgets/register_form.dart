import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart' as intl_phone;
import '../../../02_home_screen/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/platform_manager.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'custom_phone_form_field.dart';
import 'custom_text_form_field.dart';
import 'custom_text_row.dart';
import 'or_continue_with.dart';
import '../../../../app/di.dart';
import '../../../../app/extensions.dart';
import '../../../../data/special_sevices/validation_service.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/conistants_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'theme_language_row.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  intl_phone.PhoneNumber? phoneNum;
  String _countryCode = AppConstants.initialCountryCode;
  String _countryISOCode = AppConstants.initialCountryISO;
  late TextEditingController _phoneController;

  Gender? selectedGender;

  List<DropdownMenuItem<Gender>> genderItems = [];

  final _formKey = GlobalKey<FormState>();
  final _validationService = instance<IValidationService>();

  @override
  void initState() {
    super.initState();
    initPhoneController();
    _buildGenderItems();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildGenderItems();
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

  void _buildGenderItems() {
    genderItems = Gender.values.map((Gender gender) {
      return DropdownMenuItem<Gender>(
        value: gender,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(gender.displayValue);
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = BlocProvider.of<SettingsCubit>(context).currentTheme;
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return SafeArea(
          child: Center(
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
                    ThemeLanguageRow(currentTheme: currentTheme),
                    Center(
                      child: Text(
                        S.current.createAccount,
                        style: Styles.style30Bold(),
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
                              isObscureConfirmPassword =
                                  !isObscureConfirmPassword;
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
                            countryISOCode:
                                _countryISOCode, //'EG' only 2 digits
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
                    BlocListener<SettingsCubit, SettingsState>(
                      listener: (context, state) {
                        if (state is LocaleSuccess) {
                          _buildGenderItems();
                        }
                      },
                      child: DropdownButtonFormField<Gender>(
                        style: Styles.style18Medium().copyWith(
                            color: Theme.of(context).primaryColorDark),
                        value: selectedGender,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s20),
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
                          return _validationService
                              .validateGenderSelection(gender);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    //register button
                    ElevatedButton(
                      //with null in onTap the button is disable
                      onPressed: (_formKey.currentState?.validate() ?? false)
                          ? () {
                              BlocProvider.of<AuthCubit>(context).registerUser(
                                  userName: name!,
                                  email: email!,
                                  password: password!,
                                  countryMobileCode: phoneNum!.countryCode,
                                  phoneNumber: phoneNum!.number,
                                  gender: selectedGender == Gender.female
                                      ? 'female'
                                      : 'male');
                            }
                          : null,
                      child: Text(S.current.registerLabel),
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    if (kIsWeb || !isDesktop())
                      //This widget will appear on all platforms except desktop
                      OrContinueWith(
                        googleOnTap: () {
                          BlocProvider.of<AuthCubit>(context).googleSignIn();
                        },
                        facebookOnTap: () {
                          BlocProvider.of<AuthCubit>(context).facebookSignIn();
                        },
                      ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    CustomTextRow(
                      questionTxt: S.current.alreadyHaveAnAccount,
                      clickTxt: S.current.loginLabel,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
