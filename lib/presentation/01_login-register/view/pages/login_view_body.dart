import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_text_row.dart';
import '../widgets/or_continue_with.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  S.current.hello,
                  style: Styles.style30Bold(context,
                      englishFontFamily: FontConstants.font2CormorantInfant),
                ),
              ),
              Center(
                child: Text(
                  S.current.loginTitle,
                  style: Styles.style30Bold(context,
                      englishFontFamily: FontConstants.font2CormorantInfant),
                ),
              ),
              const SizedBox(
                height: 30.0,
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
                height: 20.0,
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
                    style: Styles.style18semiBold(context,
                        englishFontFamily: FontConstants.font1Monserrat),
                  ),
                ),
              ),
              //login button
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
                  btnTitle: S.current.loginLabel,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              OrContinueWith(
                googleOnTap: () {},
                facebookOnTap: () {},
              ),
              const SizedBox(
                height: 30.0,
              ),
              CusomTextRow(
                questionTxt: S.current.notAMember,
                clickTxt: S.current.registerLabel,
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.registerRoute);
                },
              ),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
