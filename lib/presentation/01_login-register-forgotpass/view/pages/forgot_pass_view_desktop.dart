import 'package:flutter/material.dart';
import '../widgets/forgot_password_form.dart';

class ForgotPasswordBodyDesktop extends StatelessWidget {
  const ForgotPasswordBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: SizedBox()),
        Expanded(flex: 2, child: ForgotPasswordForm()),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
