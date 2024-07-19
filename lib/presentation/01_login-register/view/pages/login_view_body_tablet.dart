import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_text_row.dart';
import '../widgets/or_continue_with.dart';

class LoginViewBodyTablet extends StatefulWidget {
  const LoginViewBodyTablet({super.key});

  @override
  State<LoginViewBodyTablet> createState() => _LoginViewBodyTabletState();
}

class _LoginViewBodyTabletState extends State<LoginViewBodyTablet> {
  String? email;
  String? password;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 2,
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    Center(
                      child: Text(
                        S.current.hello,
                        style: Styles.style30Bold(),
                      ),
                    ),
                    Center(
                      child: Text(
                        S.current.loginTitle,
                        style: Styles.style30Bold(),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s30,
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
                      isObscure: isObscure,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                            color: ColorManager.brown2,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          }),
                    ),
                    Align(
                      alignment: LocalizationUtils.currentLocalIsAr()
                          ? Alignment.bottomLeft
                          : Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          S.current.forgotYourPassword,
                          style: Styles.style18semiBold(),
                        ),
                      ),
                    ),
                    //login button
                    ElevatedButton(
                      //with null in onTap the button is disable
                      onPressed: (_formKey.currentState?.validate() ?? false)
                          ? () {
                              Navigator.pushNamed(context, Routes.homeRoute);
                            }
                          : null,
                      child: Text(S.current.loginLabel),
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    OrContinueWith(
                      googleOnTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.homeRoute);
                      },
                      facebookOnTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.homeRoute);
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    CustomTextRow(
                      questionTxt: S.current.notAMember,
                      clickTxt: S.current.registerLabel,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.registerRoute);
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
