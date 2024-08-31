import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../app/functions.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/platform_manager.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import '../widgets/background_painter.dart';
import 'forgot_pass_view_desktop.dart';
import 'forgot_pass_view_mobile.dart';
import 'forgot_pass_view_tablet.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* to make the screan size doesn't change when the keybourd is open.
      so in any scrollable widget you use it under this scafold in the tree , 
      if you need it to interact or scroll when the keyboard is opened
      then you have to add padding at bottom: MediaQuery.of(context).viewInsets.bottom
      */
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        /* if the custom painter doesn't have a child we must add size
        but if it has a child it takes the size of its child.
        */
        // size: Size(MediaQuery.sizeOf(context).width,
        //     MediaQuery.sizeOf(context).height),
        painter: BackgroundPainter(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ForgotPasswordLoading) {
              BlocProvider.of<AuthCubit>(context).modalProgressLoading = true;
            } else if (state is ForgotPasswordSuccess) {
              BlocProvider.of<AuthCubit>(context).modalProgressLoading = false;
              showSnakBar(context, S.current.reset_password_mail_sent);
              Navigator.pop(context);
            } else if (state is ForgotPasswordFailure) {
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
                mobileLayout: (context) => const ForgotPasswordBodyMobile(),
                tabletLayout: (context) => const ForgotPasswordBodyTablet(),
                desktopLayout: (context) => const ForgotPasswordBodyDesktop(),
              ),
            );
          },
        ),
      ),
    );
  }
}
