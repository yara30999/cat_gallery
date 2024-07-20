import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import '../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../resources/language_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import 'upload_image_with_click_options.dart';

class UploadImageWithClickOptionsAndDate extends StatelessWidget {
  final CatWithClickEntity catWithClickEntity;
  const UploadImageWithClickOptionsAndDate(
      {super.key, required this.catWithClickEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UploadImageWithClickOptions(
          catWithClickEntity: catWithClickEntity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p10,
                right: AppPadding.p10,
                top: 5,
              ),
              child: Text(
                //TODO: update local here
                GetTimeAgo.parse(
                  DateTime.parse(catWithClickEntity.createdAt!),
                  pattern: "dd-MM-yyyy hh:mm aa",
                  locale: LanguageType.english.getCode(),
                ),
                style: Styles.style16Light(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
