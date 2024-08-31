import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/settings_cubit/settings_cubit.dart';
import 'active_inactive_drawer_item.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/drawer_item_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../resources/routes_manager.dart';

class LogoutButtonBlocConsumer extends StatelessWidget {
  const LogoutButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        } else if (state is LogoutFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is LogoutLoading) {
          return const LoadingButton();
        } else {
          return const SignOutButton();
        }
      },
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<AuthCubit>(context).logout();
      },
      mouseCursor: SystemMouseCursors.click,
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ActiveDrawerItem(
            drawerItemEntity: DrawerItemEntity(
              title: S.current.Logout_account,
              icon: Icons.exit_to_app_outlined,
            ),
          );
        },
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ActiveDrawerItem(
          drawerItemEntity: DrawerItemEntity(
            title: S.current.loading,
            icon: Icons.hourglass_top,
          ),
        );
      },
    );
  }
}
