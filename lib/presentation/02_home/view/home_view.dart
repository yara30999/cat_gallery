import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/di.dart';
import '../../05_analysis_screen/view_model/cubit/analysis_cubit.dart';
import '../../resources/platform_manager.dart';
import '../view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import '01_main_breeds/view_model/cubit/cat_breeds_cubit.dart';
import '02_favorites/view_model/add_del_favourite_cubit/like_unlike_cubit.dart';
import '02_favorites/view_model/get_favourites_cubit/favourites_cubit.dart';
import '04_votes/view_model/get_votes_cubit/votes_cubit.dart';
import 'home_view_desktop.dart';
import 'home_view_mobile.dart';
import 'home_view_tablet.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavouritesCubit(instance()),
        ),
        BlocProvider(
          create: (context) => LikeUnlikeCubit(instance(), instance()),
        ),
        BlocProvider(
          create: (context) => VotesCubit(instance()),
        ),
        BlocProvider(
          create: (context) => AnalysisCubit(instance()),
        ),
        BlocProvider(
          create: (context) => CatBreedsCubit(instance(), instance()),
        )
      ],
      child: AdaptiveLayout(
        mobileLayout: (context) => BlocProvider(
          create: (context) => BottomScrollControllersCubit(),
          child: const HomeViewMobile(),
        ),
        tabletLayout: (context) => const HomeViewTablet(),
        desktopLayout: (context) => const HomeViewDesktop(),
      ),
    );
  }
}
