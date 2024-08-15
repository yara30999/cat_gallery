import 'package:flutter/material.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'alert_dialog_category.dart';

class PickCategory extends StatefulWidget {
  const PickCategory({super.key});

  @override
  State<PickCategory> createState() => _PickCategoryState();
}

class _PickCategoryState extends State<PickCategory> {
  String? _selectedCategory;

  void _openCategoryPicker(BuildContext context) async {
    final category = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CategoryAlertDialog(
          categoryList: CategoryItemEntity.items..removeAt(0),
        );
      },
    );

    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.s14,
      children: [
        Text(
          S.current.Optional,
          style: Styles.style16Medium().copyWith(color: ColorManager.red),
        ),
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => _openCategoryPicker(context),
          child: Text(
            S.current.selected_category(_selectedCategory ?? S.current.nothing),
            style: Styles.style16Medium().copyWith(
              color: _selectedCategory == null
                  ? ColorManager.blue
                  : ColorManager.green1,
              decoration:
                  _selectedCategory == null ? TextDecoration.underline : null,
              decorationColor: ColorManager.blue,
            ),
          ),
        ),
      ],
    );
  }
}
