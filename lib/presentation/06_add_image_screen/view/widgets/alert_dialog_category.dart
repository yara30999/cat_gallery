import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CategoryAlertDialog extends StatelessWidget {
  final List<CategoryItemEntity> categoryList;
  const CategoryAlertDialog({
    super.key,
    required this.categoryList,
  });

  void _categoryOnPress(
      BuildContext context, CategoryItemEntity categoryItemEntity) {
    Navigator.of(context).pop(categoryItemEntity);
  }

  void _noCategoryOnPress(
    BuildContext context,
  ) {
    Navigator.of(context).pop(null);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        S.current.select_category,
        style: Styles.style24Medium()
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      actions: [
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () {
            _noCategoryOnPress(context);
          },
          child: Text(
            S.current.do_not_know_category,
            style: Styles.style18Medium().copyWith(color: ColorManager.red),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          categoryList.length,
          (index) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSize.s400),
              child: Card(
                child: ListTile(
                  leading: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      margin: const EdgeInsets.all(AppSize.s5),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                      child: Center(
                          child: SvgPicture.asset(categoryList[index].svgIcon)),
                    ),
                  ),
                  title: Text(
                    categoryList[index].name,
                    style: Styles.style18Medium(),
                  ),
                  onTap: () {
                    _categoryOnPress(context, categoryList[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
