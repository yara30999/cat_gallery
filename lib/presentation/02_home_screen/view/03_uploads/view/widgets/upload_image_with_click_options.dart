import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../../05_analysis_screen/view_model/cubit/analysis_cubit.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/images_widgets/image_factory_method.dart';
import '../../view_model/delete_cubit/delete_image_cubit.dart';
import '../../view_model/get_uploads_cubit/uploads_cubit.dart';

class UploadImageWithClickOptions extends StatelessWidget {
  final CatWithClickEntity catWithClickEntity;

  const UploadImageWithClickOptions({
    super.key,
    required this.catWithClickEntity,
  });

  void _analysisButtonOnPress(BuildContext context, String uid) {
    BlocProvider.of<AnalysisCubit>(context).imgUrl =
        catWithClickEntity.imageUrl;
    BlocProvider.of<AnalysisCubit>(context).uid = uid;
    BlocProvider.of<AnalysisCubit>(context).imgId = catWithClickEntity.imageId;
    BlocProvider.of<AnalysisCubit>(context).getImageAnalysis();
    Navigator.pushNamed(context, Routes.analysisRoute);
  }

  void _deleteImageOnPress(BuildContext context, String uid) async {
    await BlocProvider.of<DeleteImageCubit>(context)
        .deleteImg(uid: uid, imgId: catWithClickEntity.imageId.toString());
    if (context.mounted) {
      BlocProvider.of<UploadsCubit>(context).getUploads(
        uid: uid,
        pageNum: 0,
        isFirstCall: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s8,
      child: Column(
        children: [
          CatPhoto(defaultTargetPlatform).build(catWithClickEntity.imageUrl),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ActionButton(
          icon: Icons.science_outlined,
          onPressed: () {
            _analysisButtonOnPress(context, uid);
          },
        ),
        _buildUploadedImageText(context),
        const Spacer(),
        ActionButton(
          color: ColorManager.red,
          icon: Icons.delete_forever_sharp,
          onPressed: () {
            _deleteImageOnPress(context, uid);
          },
        ),
      ],
    );
  }

  Widget _buildUploadedImageText(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: catWithClickEntity.breedName == null ? false : true,
          child: Text(
            S.current.upload_breed(catWithClickEntity.breedName ?? ''),
            style: Styles.style16Medium(),
          ),
        ),
        Visibility(
          visible: catWithClickEntity.categories == null ? false : true,
          child: Text(
            S.current.upload_category(
                catWithClickEntity.categories?.first.name ?? ''),
            style: Styles.style16Medium(),
          ),
        ),
      ],
    );
  }
}
