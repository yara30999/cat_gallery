import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterViewBodyTablet extends StatelessWidget {
  const RegisterViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: RegisterForm()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
