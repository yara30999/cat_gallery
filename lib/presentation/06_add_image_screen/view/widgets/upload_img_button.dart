import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class UploadImgButton extends StatelessWidget {
  const UploadImgButton({super.key});
  void _uploadImgButtonOnPress(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).disabledColor, // Text color
        ),
        onPressed: () {
          _uploadImgButtonOnPress(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.file_upload_outlined),
            const SizedBox(
              width: AppSize.s15,
            ),
            Text(
              S.current.upload,
              style: Styles.style16Medium(),
            ),
          ],
        ));
  }
}
