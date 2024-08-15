import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/platform_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CameraGalleryButtons extends StatelessWidget {
  const CameraGalleryButtons({
    super.key,
    required this.cameraFunc,
    required this.galleryFunc,
  });
  final void Function() cameraFunc, galleryFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isWebOrDesktopApp())
          ElevatedButton(
            onPressed: cameraFunc,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSize.s10,
              children: [
                const Icon(Icons.camera),
                Text(
                  S.current.camera,
                  style: Styles.style16Medium(),
                ),
              ],
            ),
          ),
        ElevatedButton(
          onPressed: galleryFunc,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSize.s10,
            children: [
              const Icon(Icons.image),
              Text(
                S.current.gallery,
                style: Styles.style16Medium(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
