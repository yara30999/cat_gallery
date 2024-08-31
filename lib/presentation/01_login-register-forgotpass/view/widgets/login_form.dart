import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/platform_manager.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'custom_text_form_field.dart';
import 'custom_text_row.dart';
import 'or_continue_with.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? email;
  String? password;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
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
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                  },
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
                        BlocProvider.of<AuthCubit>(context)
                            .loginUser(email: email!, password: password!);
                      }
                    : null,
                child: Text(S.current.loginLabel),
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
                questionTxt: S.current.notAMember,
                clickTxt: S.current.registerLabel,
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.registerRoute);
                },
              ),
              const SizedBox(
                height: AppSize.s30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
