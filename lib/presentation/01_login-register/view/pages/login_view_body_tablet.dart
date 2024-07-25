import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginViewBodyTablet extends StatelessWidget {
  const LoginViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: LoginForm()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
