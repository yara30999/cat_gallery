import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/platform_manager.dart';
import '../view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import 'home_view_desktop.dart';
import 'home_view_mobile.dart';
import 'home_view_tablet.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => BlocProvider(
        create: (context) => BottomScrollControllersCubit(),
        child: const HomeViewMobile(),
      ),
      tabletLayout: (context) => const HomeViewTablet(),
      desktopLayout: (context) => const HomeViewDesktop(),
    );
  }
}
