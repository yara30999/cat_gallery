import 'package:flutter/material.dart';
import '../../resources/styles_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "this is home page",
          style: Styles.textStyle30En2(context),
        ),
      ),
      body: Center(
        child: Text(
          'hi yara اهلا يارا ',
          style: Styles.textStyle30En2Italic(context),
        ),
      ),
    );
  }
}
