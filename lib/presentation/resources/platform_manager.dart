import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'conistants_manager.dart';

bool isDesktop() {
  return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
}

bool isWebOrDesktopApp() {
  if (kIsWeb) {
    return true;
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return false;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return true;
      default:
        return false;
    }
  }
}

class PlatformWidget extends StatelessWidget {
  const PlatformWidget(
      {super.key,
      required this.androidIos,
      required this.web,
      required this.desktop});
  final WidgetBuilder androidIos;
  final WidgetBuilder web;
  final WidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return web(context);
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
        case TargetPlatform.iOS:
          return androidIos(context);
        case TargetPlatform.macOS:
        case TargetPlatform.windows:
        case TargetPlatform.linux:
          return desktop(context);
        default:
          return androidIos(context);
      }
    }
  }
}

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});
  // very important to use WidgetBuilder here
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < AppConstants.breakPointMobileTablet) {
          // so this is fun can never be build unless it called
          return mobileLayout(context);
        } else if (constraints.maxWidth < AppConstants.breakPointTabletLaptop) {
          // so this is fun can never be build unless it called
          return tabletLayout(context);
        } else {
          // so this is fun can never be build unless it called
          return desktopLayout(context);
        }
      },
    );
  }
}

class MiniAdaptiveLayout extends StatelessWidget {
  const MiniAdaptiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});
  // very important to use WidgetBuilder here
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (MediaQuery.sizeOf(context).width <
            AppConstants.breakPointMobileTablet) {
          // so this is fun can never be build unless it called
          return mobileLayout(context);
        } else if (MediaQuery.sizeOf(context).width <
            AppConstants.breakPointTabletLaptop) {
          // so this is fun can never be build unless it called
          return tabletLayout(context);
        } else {
          // so this is fun can never be build unless it called
          return desktopLayout(context);
        }
      },
    );
  }
}
