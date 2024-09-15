import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class ActiveCatigoryItem extends StatelessWidget {
  const ActiveCatigoryItem({
    super.key,
    required this.categoryItemEntity,
  });
  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: AppSize.s40),
      child: Material(
        elevation: AppSize.s4,
        borderRadius: BorderRadius.circular(AppSize.s8),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).disabledColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(AppSize.s5),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s8),
                ),
                child:
                    Center(child: SvgPicture.asset(categoryItemEntity.svgIcon)),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(categoryItemEntity.name,
                  textAlign: TextAlign.center,
                  style: Styles.style18Medium()
                      .copyWith(color: ColorManager.white)),
            ),
            const SizedBox(
              width: AppSize.s5,
            )
          ],
        ),
      ),
    );
  }
}

class InActiveCatigoryItem extends StatelessWidget {
  const InActiveCatigoryItem({
    super.key,
    required this.categoryItemEntity,
  });
  final CategoryItemEntity categoryItemEntity;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: AppSize.s40),
      child: Material(
        elevation: AppSize.s4,
        borderRadius: BorderRadius.circular(AppSize.s8),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).unselectedWidgetColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(AppSize.s5),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s8),
                ),
                child:
                    Center(child: SvgPicture.asset(categoryItemEntity.svgIcon)),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(categoryItemEntity.name,
                  textAlign: TextAlign.center,
                  style: Styles.style18Medium()
                      .copyWith(color: ColorManager.black)),
            ),
            const SizedBox(
              width: AppSize.s5,
            )
          ],
        ),
      ),
    );
  }
}
