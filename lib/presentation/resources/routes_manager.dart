import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/di.dart';
import '../../generated/l10n.dart';
import '../00_on_boarding/view/on_boarding_view.dart';
import '../01_login-register-forgotpass/view/pages/forgot_pass_view.dart';
import '../01_login-register-forgotpass/view/pages/login_view.dart';
import '../01_login-register-forgotpass/view/pages/register_view.dart';
import '../02_home/view/01_main_breeds/view_model/cubit/cat_breeds_cubit.dart';
import '../02_home/view/02_favorites/view/favorites_view_body.dart';
import '../02_home/view/01_main_breeds/view/main_breeds_body.dart';
import '../02_home/view/home_view.dart';
import '../02_home/view/03_uploads/view/uploads_view_body.dart';
import '../02_home/view/04_votes/view/votes_view_body.dart';
import '../03_specific_breed/view/specific_breed_body.dart';
import '../03_specific_breed/view_model/breed/specific_breed_cubit.dart';
import '../03_specific_breed/view_model/images/specific_images_cubit.dart';
import '../04_no_breed/view/no_breed_body.dart';
import '../05_analysis_screen/view/analysis_body.dart';
import '../06_add_image_screen/view/add_image_body.dart';

class Routes {
  static const String onBoardingRoute = "/";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
  static const String forgotPasswordRoute = "/forgot_password_route";
  static const String homeRoute = "/home_route";
  static const String mainBreedsRoute = "/";
  static const String specificBreedRoute = "/specific_breed_route";
  static const String randomBreedRoute = "/random_breeds_route";
  static const String analysisRoute = "/analysis_route";
  static const String favoritesRoute = "/";
  static const String scaleImageRoute = "/scale_image_route";
  static const String votesRoute = "/";
  static const String uploadsRoute = "/";
  static const String addImageRoute = "add_image_route";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getMainBreedsNavigator(
      BuildContext context, RouteSettings settings) {
    // final ScrollController? controller =
    //     settings.arguments as ScrollController?;
    switch (settings.name) {
      case Routes.mainBreedsRoute:
        return MaterialPageRoute(builder: (_) => const MainBreedsBody());
      case Routes.specificBreedRoute:
        return MaterialPageRoute(builder: (_) => const SpecificBreedBody());
      case Routes.randomBreedRoute:
        return MaterialPageRoute(builder: (_) => const NoBreedBody());
      case Routes.analysisRoute:
        return MaterialPageRoute(builder: (_) => const AnalysisBody());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getFavoritesNavigator(
      BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.favoritesRoute:
        return MaterialPageRoute(builder: (_) => const FavoritesViewBody());
      case Routes.analysisRoute:
        return MaterialPageRoute(builder: (_) => const AnalysisBody());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getUploadsNavigator(
      BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.uploadsRoute:
        return MaterialPageRoute(builder: (_) => const UploadsViewBody());
      case Routes.analysisRoute:
        return MaterialPageRoute(builder: (_) => const AnalysisBody());
      case Routes.addImageRoute:
        return MaterialPageRoute(builder: (_) => const AddImageBody());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getVotesNavigator(
      BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.votesRoute:
        return MaterialPageRoute(builder: (_) => const VotesViewBody());
      case Routes.analysisRoute:
        return MaterialPageRoute(builder: (_) => const AnalysisBody());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(S.current.noRouteFound),
              ),
              body: Center(child: Text(S.current.noRouteFound)),
            ));
  }
}

class MainBreedsNavigator extends StatelessWidget {
  //final ScrollController? scrollController;
  const MainBreedsNavigator({
    super.key, //required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              CatBreedsCubit(instance(), instance()),
        ),
        BlocProvider(
          create: (context) => SpecificBreedCubit(instance()),
        ),
        BlocProvider(
          create: (context) => SpecificImagesCubit(instance()),
        ),
      ],
      child: Navigator(
        initialRoute: Routes.mainBreedsRoute,
        //onGenerateRoute: RouteGenerator.getMainBreedsNavigator,
        // onGenerateRoute: (settings) =>
        //     RouteGenerator.getMainBreedsNavigator(RouteSettings(
        //   name: settings.name,
        //   arguments: scrollController,
        // )),
        onGenerateRoute: (settings) =>
            RouteGenerator.getMainBreedsNavigator(context, settings),
      ),
    );
  }
}

class FavoritesNavigator extends StatelessWidget {
  const FavoritesNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: Routes.favoritesRoute,
        onGenerateRoute: (settings) =>
            RouteGenerator.getFavoritesNavigator(context, settings));
  }
}

class UploadsNavigator extends StatelessWidget {
  const UploadsNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Routes.uploadsRoute,
      onGenerateRoute: (settings) =>
          RouteGenerator.getUploadsNavigator(context, settings),
    );
  }
}

class VotesNavigator extends StatelessWidget {
  const VotesNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Routes.favoritesRoute,
      onGenerateRoute: (settings) =>
          RouteGenerator.getVotesNavigator(context, settings),
    );
  }
}
