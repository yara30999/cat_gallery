import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterViewBodyDesktop extends StatelessWidget {
  const RegisterViewBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: SizedBox()),
        Expanded(flex: 2, child: RegisterForm()),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
