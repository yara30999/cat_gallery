import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../resources/platform_manager.dart';
import '../../../view_model/settings_cubit/settings_cubit.dart';
import '../view_model/get_uploads_cubit/uploads_cubit.dart';
import 'uploads_view_body_desktop.dart';
import 'uploads_view_body_mobile.dart';
import 'uploads_view_body_tablet.dart';

class UploadsViewBody extends StatelessWidget {
  const UploadsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LocaleSuccess) {
          BlocProvider.of<UploadsCubit>(context)
              .getUploads(uid: uid, pageNum: 0, isFirstCall: true);
        }
      },
      child: MiniAdaptiveLayout(
        mobileLayout: (context) => const UploadsViewBodyMobile(),
        tabletLayout: (context) => const UploadsViewBodyTablet(),
        desktopLayout: (context) => const UploadsViewBodyDesktop(),
      ),
    );
  }
}
