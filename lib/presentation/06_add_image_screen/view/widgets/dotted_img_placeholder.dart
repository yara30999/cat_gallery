import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class DottedImagePlaceholer extends StatelessWidget {
  const DottedImagePlaceholer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.add_photo_alternate,
            size: AppSize.s50,
          ),
        ),
        if (kIsWeb)
          Text(
            S.current.click_or_drag_image_file,
            style: Styles.style22Medium().copyWith(color: ColorManager.white),
          ),
        if (!kIsWeb)
          Text(
            S.current.add_image_file,
            style: Styles.style22Medium().copyWith(color: ColorManager.white),
          ),
      ],
    );
  }
}
