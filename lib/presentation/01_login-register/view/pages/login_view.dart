import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../resources/conistants_manager.dart';
import 'login_view_body.dart';
import '../widgets/background_painter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: AppConstants.splashDelay))
        .then((value) => {FlutterNativeSplash.remove()});
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
        child: const LoginViewBody(),
      ),
    );
  }
}
