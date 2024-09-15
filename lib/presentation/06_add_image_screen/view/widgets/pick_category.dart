import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home_screen/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/upload_image_cubit.dart';
import 'alert_dialog_category.dart';

class PickCategory extends StatefulWidget {
  const PickCategory({super.key});

  @override
  State<PickCategory> createState() => _PickCategoryState();
}

class _PickCategoryState extends State<PickCategory> {
  String? _selectedCategory;

  void _openCategoryPicker(BuildContext context) async {
    final categoryItemEntity = await showDialog<CategoryItemEntity>(
      context: context,
      builder: (BuildContext context) {
        return CategoryAlertDialog(
          categoryList: CategoryItemEntity.items..removeAt(0),
        );
      },
    );

    setState(() {
      _selectedCategory = categoryItemEntity?.name;
    });
    if (context.mounted) {
      BlocProvider.of<UploadImageCubit>(context).categoryId =
          categoryItemEntity?.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.s14,
      children: [
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(
              S.current.Optional,
              style: Styles.style16Medium().copyWith(color: ColorManager.red),
            );
          },
        ),
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => _openCategoryPicker(context),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Text(
                S.current
                    .selected_category(_selectedCategory ?? S.current.nothing),
                style: Styles.style16Medium().copyWith(
                  color: _selectedCategory == null
                      ? ColorManager.blue
                      : ColorManager.green1,
                  decoration: _selectedCategory == null
                      ? TextDecoration.underline
                      : null,
                  decorationColor: ColorManager.blue,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
