import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_time_ago/get_time_ago.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/settings_cubit/settings_cubit.dart';
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
                GetTimeAgo.parse(
                  DateTime.parse(catWithClickEntity.createdAt!),
                  pattern: "dd-MM-yyyy hh:mm aa",
                  locale: BlocProvider.of<SettingsCubit>(context)
                      .currentLocale
                      .languageCode,
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
