import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../01_login-register/view/pages/login_view.dart';
import '../01_login-register/view/pages/register_view.dart';
import '../02_home/main_breeds/view/main_breeds_body.dart';
import '../02_home/home_view.dart';
import '../03_specific_breed/specific_breed_body.dart';
import '../04_random_breed/random_breed_body.dart';

class Routes {
  static const String loginRoute = "/";
  static const String registerRoute = "/register_route";
  static const String homeRoute = "/home_route";
  static const String mainBreedsRoute = "/";
  static const String specificBreedRoute = "/specific_breed_route";
  static const String randomBreedRoute = "/random_breeds_route";
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
    final ScrollController controller = settings.arguments as ScrollController;
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
  final ScrollController scrollController;
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
