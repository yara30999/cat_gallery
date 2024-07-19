import 'package:flutter/material.dart';
import '../../../resources/platform_manager.dart';
import '../widgets/background_painter.dart';
import 'register_view_body_desktop.dart';
import 'register_view_body_mobile.dart';
import 'register_view_body_tablet.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          mobileLayout: (context) => const RegisterViewBodyMobile(),
          tabletLayout: (context) => const RegisterViewBodyTablet(),
          desktopLayout: (context) => const RegisterViewBodyDesktop(),
        ),
      ),
    );
  }
}
