import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../app/functions.dart';
import '../../../resources/platform_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'login_view_body_desktop.dart';
import 'login_view_body_mobile.dart';
import '../widgets/background_painter.dart';
import 'login_view_body_tablet.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginLoading ||
                state is GoogleLoading ||
                state is FacebookLoading) {
              BlocProvider.of<AuthCubit>(context).modalProgressLoading = true;
            } else if (state is LoginSuccess ||
                state is GoogleSuccess ||
                state is FacebookSuccess) {
              Navigator.pushReplacementNamed(context, Routes.homeRoute);
              BlocProvider.of<AuthCubit>(context).modalProgressLoading = false;
            } else if (state is LoginFailure ||
                state is GoogleFailure ||
                state is FacebookFailure) {
              showSnakBar(
                  context, BlocProvider.of<AuthCubit>(context).errMessage!);
              BlocProvider.of<AuthCubit>(context).modalProgressLoading = false;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall:
                  BlocProvider.of<AuthCubit>(context).modalProgressLoading,
              child: AdaptiveLayout(
                mobileLayout: (context) => const LoginViewBodyMobile(),
                tabletLayout: (context) => const LoginViewBodyTablet(),
                desktopLayout: (context) => const LoginViewBodyDesktop(),
              ),
            );
          },
        ),
      ),
    );
  }
}
