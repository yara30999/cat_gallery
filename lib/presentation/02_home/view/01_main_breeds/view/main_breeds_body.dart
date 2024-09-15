import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/conistants_manager.dart';
import '../../../../resources/platform_manager.dart';
import '../../../view_model/settings_cubit/settings_cubit.dart';
import '../view_model/cubit/cat_breeds_cubit.dart';
import 'main_breed_body_desktop.dart';
import 'main_breed_body_mobile.dart';
import 'main_breed_body_tablet.dart';

class MainBreedsBody extends StatelessWidget {
  const MainBreedsBody({
    super.key,
  });

  Future<void> _refreshBreedsData(BuildContext context) async {
    // Simulate a delay to mimic fetching new data from a data source
    await Future.delayed(const Duration(seconds: AppConstants.refreshDelay));
    // first check if the widget sill on the tree.
    //because we are in async gaps.
    if (context.mounted) {
      //the authobj is coming from cashe or api
      BlocProvider.of<CatBreedsCubit>(context)
          .refreshBreeds(uid: BlocProvider.of<AuthCubit>(context).authObj!.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LocaleSuccess) {
          BlocProvider.of<CatBreedsCubit>(context).refreshBreeds(
              uid: BlocProvider.of<AuthCubit>(context).authObj!.uid);
        }
      },
      child: RefreshIndicator(
        color: ColorManager.white,
        onRefresh: () {
          return _refreshBreedsData(context);
        },
        child: MiniAdaptiveLayout(
          mobileLayout: (context) => const MainBreedsBodyMobile(),
          tabletLayout: (context) => const MainBreedsBodyTablet(),
          desktopLayout: (context) => const MainBreedsBodyDesktop(),
        ),
      ),
    );
  }
}
