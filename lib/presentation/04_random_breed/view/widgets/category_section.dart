import 'package:flutter/material.dart';
import '../../../../domain/entities/category_item.dart';
import 'my_custom_scroll_behavior.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/values_manager.dart';
import 'category_item.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: CategoryItemEntity.items.length,
            itemBuilder: (buildContext, index) {
              return GestureDetector(
                onTap: () {
                  if (activeIndex != index) {
                    setState(() {
                      activeIndex = index;
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: LocalizationUtils.currentLocalIsAr()
                          ? 0.0
                          : AppPadding.p10,
                      left: LocalizationUtils.currentLocalIsAr()
                          ? AppPadding.p10
                          : 0.0),
                  child: CategoryItem(
                    isActive: activeIndex == index,
                    categoryItemEntity: CategoryItemEntity.items[index],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
