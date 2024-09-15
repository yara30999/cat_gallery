import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../02_home_screen/view/widgets/persistenet_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../view_model/cubit/upload_image_cubit.dart';
import 'widgets/add_image_header.dart';
import 'widgets/add_image_secion_desktop.dart';

class AddImageBodyDesktop extends StatelessWidget {
  const AddImageBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
    BlocProvider.of<UploadImageCubit>(context).uid = uid;
    return CustomScrollView(
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p60, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AddImageHeader(
              firstStyle: Styles.style36Medium(),
              secondStyle: Styles.style20Regular(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p40,
            vertical: AppPadding.p130,
          ),
          sliver: SliverToBoxAdapter(
            child: AddImageSectionDesktop(),
          ),
        ),
      ],
    );
  }
}
