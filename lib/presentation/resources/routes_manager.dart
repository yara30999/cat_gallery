import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../01_login-register/view/pages/login_view.dart';
import '../01_login-register/view/pages/register_view.dart';
import '../02_home/02_favorites/view/favorites_view_body.dart';
import '../02_home/01_main_breeds/view/main_breeds_body.dart';
import '../02_home/home_view.dart';
import '../02_home/03_uploads/view/uploads_view_body.dart';
import '../02_home/04_votes/view/votes_view_body.dart';
import '../03_specific_breed/view/specific_breed_body.dart';
import '../04_random_breed/view/random_breed_body.dart';
import '../05_analysis_screen/view/analysis_body.dart';

class Routes {
  static const String loginRoute = "/";
  static const String registerRoute = "/register_route";
  static const String homeRoute = "/home_route";
  static const String mainBreedsRoute = "/";
  static const String specificBreedRoute = "/specific_breed_route";
  static const String randomBreedRoute = "/random_breeds_route";
  static const String analysisRoute = "/analysis_route";
  static const String favoritesRoute = "/";
  static const String scaleImageRoute = "/scale_image_route";
  static const String votesRoute = "/";
  static const String uploadsRoute = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getMainBreedsNavigator(RouteSettings settings) {
    final ScrollController? controller =
        settings.arguments as ScrollController?;
    switch (settings.name) {
      case Routes.mainBreedsRoute:
        return MaterialPageRoute(
            builder: (_) => MainBreedsBody(
                  mainBreedsScreenScrollController: controller,
                ));
      case Routes.specificBreedRoute:
        return MaterialPageRoute(
            builder: (_) => SpecificBreedBody(
                  specificBreedScreenScrollController: controller,
                ));
      case Routes.randomBreedRoute:
        return MaterialPageRoute(
            builder: (_) => RandomBreedBody(
                  randomBreedScreenScrollController: controller,
                ));
      case Routes.analysisRoute:
        return MaterialPageRoute(
            builder: (_) => AnalysisBody(
                  analysisScreenScrollController: controller,
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getFavoritesNavigator(RouteSettings settings) {
    final ScrollController? controller =
        settings.arguments as ScrollController?;
    switch (settings.name) {
      case Routes.favoritesRoute:
        return MaterialPageRoute(
            builder: (_) => FavoritesViewBody(
                  favoratesScreenScrollController: controller,
                ));
      case Routes.analysisRoute:
        return MaterialPageRoute(
            builder: (_) => AnalysisBody(
                  analysisScreenScrollController: controller,
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getUploadsNavigator(RouteSettings settings) {
    final ScrollController? controller =
        settings.arguments as ScrollController?;
    switch (settings.name) {
      case Routes.uploadsRoute:
        return MaterialPageRoute(
            builder: (_) => UploadsViewBody(
                  uploadsScreenScrollController: controller,
                ));
      case Routes.analysisRoute:
        return MaterialPageRoute(
            builder: (_) => AnalysisBody(
                  analysisScreenScrollController: controller,
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getVotesNavigator(RouteSettings settings) {
    final ScrollController? controller =
        settings.arguments as ScrollController?;
    switch (settings.name) {
      case Routes.votesRoute:
        return MaterialPageRoute(
            builder: (_) => VotesViewBody(
                  votesScreenScrollController: controller,
                ));
      case Routes.analysisRoute:
        return MaterialPageRoute(
            builder: (_) => AnalysisBody(
                  analysisScreenScrollController: controller,
                ));
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
  final ScrollController? scrollController;
  const MainBreedsNavigator({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Routes.mainBreedsRoute,
      onGenerateRoute: (settings) =>
          RouteGenerator.getMainBreedsNavigator(RouteSettings(
        name: settings.name,
        arguments: scrollController,
      )),
    );
  }
}

class FavoritesNavigator extends StatelessWidget {
  final ScrollController? scrollController;
  const FavoritesNavigator({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Routes.favoritesRoute,
      onGenerateRoute: (settings) =>
          RouteGenerator.getFavoritesNavigator(RouteSettings(
        name: settings.name,
        arguments: scrollController,
      )),
    );
  }
}

class UploadsNavigator extends StatelessWidget {
  final ScrollController? scrollController;
  const UploadsNavigator({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Routes.uploadsRoute,
      onGenerateRoute: (settings) =>
          RouteGenerator.getUploadsNavigator(RouteSettings(
        name: settings.name,
        arguments: scrollController,
      )),
    );
  }
}

class VotesNavigator extends StatelessWidget {
  final ScrollController? scrollController;
  const VotesNavigator({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Routes.favoritesRoute,
      onGenerateRoute: (settings) =>
          RouteGenerator.getVotesNavigator(RouteSettings(
        name: settings.name,
        arguments: scrollController,
      )),
    );
  }
}
