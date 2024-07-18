import 'package:flutter/material.dart';
import '../../../domain/entities/cat_with_click_entity.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'cat_image_with_click_options.dart';

class CatImageWithClickOptionsAndDate extends StatelessWidget {
  final CatWithClickEntity catWithClickEntity;
  const CatImageWithClickOptionsAndDate(
      {super.key, required this.catWithClickEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CatImageWithClickOptions(
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
                //TODO: use time ago package
                // use catWithClickEntity.createdAt
                '12-5-2024  5:30',
                style: Styles.style16Medium(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
