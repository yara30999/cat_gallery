import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../app/functions.dart';
import '../../../resources/routes_manager.dart';
import '../../view_model/cubit/auth_cubit.dart';
import '../widgets/register_form.dart';

class RegisterViewBodyDesktop extends StatelessWidget {
  const RegisterViewBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          BlocProvider.of<AuthCubit>(context).modalProgressLoading = true;
        } else if (state is RegisterSuccess) {
          // get stream of messages before navigation
          //BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, Routes.homeRoute);
          BlocProvider.of<AuthCubit>(context).modalProgressLoading = false;
        } else if (state is RegisterFailure) {
          showSnakBar(context, state.errMessage);
          BlocProvider.of<AuthCubit>(context).modalProgressLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: BlocProvider.of<AuthCubit>(context).modalProgressLoading,
          child: const Row(
            children: [
              Expanded(flex: 3, child: SizedBox()),
              Expanded(flex: 2, child: RegisterForm()),
              Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
