import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../01_login-register/view/pages/login_view.dart';
import '../02_home/view/home_view.dart';

class Routes {
  static const String homeRoute = "/home_route";
  static const String loginRoute = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
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
