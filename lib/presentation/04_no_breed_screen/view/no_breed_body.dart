import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/di.dart';
import '../../resources/platform_manager.dart';
import '../view_model/bloc/no_breed_bloc.dart';
import 'no_breed_body_desktop.dart';
import 'no_breed_body_mobile.dart';
import 'no_breed_body_tablet.dart';

class NoBreedBody extends StatelessWidget {
  const NoBreedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoBreedBloc(instance(), instance()),
      child: MiniAdaptiveLayout(
        mobileLayout: (context) => const NoBreedBodyMobile(),
        tabletLayout: (context) => const NoBreedBodyTablet(),
        desktopLayout: (context) => const NoBreedBodyDesktop(),
      ),
    );
  }
}
