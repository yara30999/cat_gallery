import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../02_home/view_model/settings_cubit/settings_cubit.dart';
import '../../resources/platform_manager.dart';
import '../view_model/breed/specific_breed_cubit.dart';
import 'specific_breed_body_desktop.dart';
import 'specific_breed_body_mobile.dart';
import 'specific_breed_body_tablet.dart';

class SpecificBreedBody extends StatelessWidget {
  const SpecificBreedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LocaleSuccess) {
          BlocProvider.of<SpecificBreedCubit>(context).getBreedInfo(uid: uid);
        }
      },
      child: MiniAdaptiveLayout(
        mobileLayout: (context) => const SpecificBreedBodyMobile(),
        tabletLayout: (context) => const SpecificBreedBodyTablet(),
        desktopLayout: (context) => const SpecificBreedBodyDesktop(),
      ),
    );
  }
}
