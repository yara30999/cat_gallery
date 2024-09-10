import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/di.dart';
import '../../../app/functions.dart';
import '../../resources/platform_manager.dart';
import '../view_model/cubit/upload_image_cubit.dart';
import 'add_image_body_desktop.dart';
import 'add_image_body_mobile.dart';
import 'add_image_body_tablet.dart';

class AddImageBody extends StatelessWidget {
  const AddImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadImageCubit(instance()),
      child: BlocListener<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          if (state is UploadImageFailure) {
            showSnakBar(context, state.errMessage);
          } else if (state is UploadImageEmpty) {
            showSnakBar(context, state.errMessage);
          } else if (state is UploadImageSuccess) {
            Navigator.pop(context);
          }
        },
        child: MiniAdaptiveLayout(
          mobileLayout: (context) => const AddImageBodyMobile(),
          tabletLayout: (context) => const AddImageBodyTablet(),
          desktopLayout: (context) => const AddImageBodyDesktop(),
        ),
      ),
    );
  }
}
