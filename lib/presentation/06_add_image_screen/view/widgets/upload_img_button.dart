import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/upload_image_cubit.dart';

class UploadImgButton extends StatelessWidget {
  const UploadImgButton({super.key});
  void _uploadImgButtonOnPress(BuildContext context) {
    BlocProvider.of<UploadImageCubit>(context).upload();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        if (state is UploadImageLoading) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).disabledColor, // Text color
            ),
            onPressed: null,
            child: Text(
              S.current.loading,
              style: Styles.style16Medium(),
            ),
          );
        } else {
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
      },
    );
  }
}
