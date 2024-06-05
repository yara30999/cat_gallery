import 'package:flutter/material.dart';

import '../../../../app/di.dart';
import '../../../../data/special_sevices/validation_service.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_divider_with_text.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_text_row.dart';
import '../widgets/social_componant.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _validationService = instance<IValidationService>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        /*we have to add padding in the bottom when the keybourd is Opened,
        the padding must be the same size of the Keybourd,
        this makes the SingleChildScrollView scrollable when the keyboard is opened,
        we used this because in the scaffald we did "resizeToAvoidBottomInset: false"
        hover on it to read the reason .*/
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.95,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    S.current.createAccount,
                    style: Styles.style30Bold(context,
                        englishFontFamily: FontConstants.font2CormorantInfant),
                  ),
                  const SizedBox(
                    height: 30.0,
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
                    height: 20.0,
                  ),
                  CustomTextField(
                    label: S.current.emailLabel,
                    inputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    label: S.current.passwordLabel,
                    inputType: TextInputType.visiblePassword,
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
                    height: 20.0,
                  ),
                  CustomTextField(
                    label: S.current.passwordConfirmLabel,
                    inputType: TextInputType.visiblePassword,
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
                    height: 20.0,
                  ),
                  //login button
                  SizedBox(
                    height:
                        MediaQuery.sizeOf(context).height * .06 < AppSize.s40
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
                    height: 30.0,
                  ),
                  CustomDividerWithText(
                    text: Text(
                      S.current.orContinueWith,
                      style: Styles.style20Bold(context,
                          englishFontFamily:
                              FontConstants.font2CormorantInfant),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialComponant(
                          svgString: SvgAssets.google,
                          onTap: () {},
                          color: ColorManager.brown2,
                        ),
                        SocialComponant(
                          svgString: SvgAssets.facebook,
                          onTap: () {},
                          color: ColorManager.brown2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CusomTextRow(
                    questionTxt: S.current.alreadyHaveAnAccount,
                    clickTxt: S.current.loginLabel,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
