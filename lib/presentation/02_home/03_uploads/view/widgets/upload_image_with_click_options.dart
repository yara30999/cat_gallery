import 'package:flutter/material.dart';
import '../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/platform_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/pinch_zoom_image.dart';

class UploadImageWithClickOptions extends StatelessWidget {
  final CatWithClickEntity catWithClickEntity;

  const UploadImageWithClickOptions({
    super.key,
    required this.catWithClickEntity,
  });

  void _analysisButtonOnPress(BuildContext context) {
    Navigator.pushNamed(context, Routes.analysisRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s8,
      child: Column(
        children: [
          isWebOrDesktopApp()
              ? Image.network(
                  catWithClickEntity.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : PinchZoomImage(
                  assetName: catWithClickEntity.imageUrl,
                ),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ActionButton(
          icon: Icons.science_outlined,
          onPressed: () {
            _analysisButtonOnPress(context);
          },
        ),
        _buildUploadedImageText(context),
        const Spacer(),
        ActionButton(
          color: ColorManager.red,
          icon: Icons.delete_forever_sharp,
          onPressed: () {},
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
          visible:
              catWithClickEntity.categories?.first.name == null ? false : true,
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
