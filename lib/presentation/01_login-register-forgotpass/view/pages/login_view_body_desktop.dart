import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginViewBodyDesktop extends StatelessWidget {
  const LoginViewBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: SizedBox()),
        Expanded(flex: 2, child: LoginForm()),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
