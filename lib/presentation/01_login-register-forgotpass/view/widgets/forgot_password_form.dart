import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'custom_text_form_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  String? email;
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
                  S.current.forgotYourPassword,
                  style: Styles.style30Bold(),
                ),
              ),
              Center(
                child: Text(
                  S.current.no_worries,
                  style: Styles.style22Medium(),
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
              //forgot password button
              ElevatedButton(
                //with null in onTap the button is disable
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        BlocProvider.of<AuthCubit>(context)
                            .forgotPassword(email: email!);
                      }
                    : null,
                child: Text(S.current.reset_password),
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LocalizationUtils.currentLocalIsAr()
                            ? Icons.arrow_circle_right_outlined
                            : Icons.arrow_circle_left_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      Text(
                        S.current.go_back_to_login,
                        style: Styles.style18Medium()
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
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
