import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../view_model/cubit/upload_image_cubit.dart';
import 'widgets/add_image_header.dart';
import 'widgets/add_image_secion_tablet.dart';

class AddImageBodyTablet extends StatelessWidget {
  const AddImageBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
    BlocProvider.of<UploadImageCubit>(context).uid = uid;
    return CustomScrollView(
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p40, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AddImageHeader(
              firstStyle: Styles.style22Medium(),
              secondStyle: Styles.style16Regular(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AddImageSectionTablet(),
          ),
        ),
      ],
    );
  }
}
