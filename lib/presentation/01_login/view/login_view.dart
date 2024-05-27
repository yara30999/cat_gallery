import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/conistants_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_divider_with_text.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/custom_text_row.dart';
import 'widgets/social_componant.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: AppConstants.splashDelay))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}

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
                    'Hello!',
                    style: Styles.textStyle30En2(context),
                  ),
                  Text(
                    'Sign into your Account.',
                    style: Styles.textStyle30En2(context),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomEmailField(
                    label: 'Email Id',
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
                    label: 'Password',
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        'Forgot Your Password?',
                        style: Styles.textStyle18En1(context)
                            .copyWith(color: ColorManager.bink1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                      btnTitle: 'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomDividerWithText(
                    text: Text(
                      'Or Continue With',
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
                    questionTxt: 'Not a member? ',
                    clickTxt: 'Register',
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
