import 'dart:async';
import 'package:flutter/material.dart';
import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../01_login-register-forgotpass/view/widgets/background_painter.dart';
import '../../resources/conistants_manager.dart';
import '../../resources/platform_manager.dart';
import '../../resources/routes_manager.dart';
import 'on_boarding_view_desktop.dart';
import 'on_boarding_view_mobile.dart';
import 'on_boarding_view_tablet.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance();

  _startDelay() {
    _timer =
        Timer(const Duration(seconds: AppConstants.onboardingDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              // navigate to home screen
              Navigator.pushReplacementNamed(context, Routes.homeRoute)
            }
          else
            {
              // navigate to login screen
              Navigator.pushReplacementNamed(context, Routes.loginRoute)
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* to make the screan size doesn't change when the keybourd is open.
      so in any scrollable widget you use it under this scafold in the tree , 
      if you need it to interact or scroll when the keyboard is opened
      then you have to add padding at bottom: MediaQuery.of(context).viewInsets.bottom
      */
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        /* if the custom painter doesn't have a child we must add size
        but if it has a child it takes the size of its child.
        */
        // size: Size(MediaQuery.sizeOf(context).width,
        //     MediaQuery.sizeOf(context).height),
        painter: BackgroundPainter(),
        child: AdaptiveLayout(
          mobileLayout: (context) => const OnBoardingViewMobile(),
          tabletLayout: (context) => const OnBoardingViewTablet(),
          desktopLayout: (context) => const OnBoardingViewDesktop(),
        ),
      ),
    );
  }
}
