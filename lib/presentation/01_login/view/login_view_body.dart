import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_divider_with_text.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/custom_text_row.dart';
import 'widgets/social_componant.dart';

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
                    AppStrings.hello,
                    style: Styles.textStyle30En2(context),
                  ),
                  Text(
                    AppStrings.loginTitle,
                    style: Styles.textStyle30En2(context),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomEmailField(
                    label: AppStrings.emailLabel,
                    onChanged: (data) {
                      setState(() {
                        email = data;
                      });
                    },
                    suffixIcon: Icon(
                      Icons.email_sharp,
                      color: ColorManager.brown2,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomPasswordField(
                    label: AppStrings.passwordLabel,
                    onChanged: (data) {
                      setState(() {
                        password = data;
                      });
                    },
                    isVisible: isObscure,
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
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        AppStrings.forgotYourPassword,
                        style: Styles.textStyle18En1(context)
                            .copyWith(color: ColorManager.pink1),
                      ),
                    ),
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
                      btnTitle: AppStrings.loginLabel,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomDividerWithText(
                    text: Text(
                      AppStrings.orContinueWith,
                      style: Styles.textStyle20En2(context),
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
                    questionTxt: AppStrings.notAMember,
                    clickTxt: AppStrings.registerLabel,
                    onTap: () {},
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
