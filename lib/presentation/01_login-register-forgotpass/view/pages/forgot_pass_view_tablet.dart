import 'package:flutter/material.dart';
import '../widgets/forgot_password_form.dart';

class ForgotPasswordBodyTablet extends StatelessWidget {
  const ForgotPasswordBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: ForgotPasswordForm()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
