import 'package:flutter/material.dart';
import '../../../domain/entities/category_item.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../resources/language_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/category_item.dart';
import 'widgets/random_breed_grid_builder.dart';
import 'widgets/random_breed_header.dart';

class RandomBreedBodyDesktop extends StatelessWidget {
  const RandomBreedBodyDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ImagesBody(),
        ),
        CategoryBody(),
      ],
    );
  }
}

class ImagesBody extends StatelessWidget {
  const ImagesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p60, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: RandomBreedHeader(
              headerStyle: Styles.style36Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: RandomBreedGridBuilder(),
        ),
      ],
    );
  }
}

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s15,
      child: SizedBox(
        height: double.infinity,
        width: AppSize.s160,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                top: AppPadding.p10,
                right:
                    LocalizationUtils.currentLocalIsAr() ? AppPadding.p10 : 0.0,
                left:
                    LocalizationUtils.currentLocalIsAr() ? 0.0 : AppPadding.p10,
              ),
              sliver: SliverList.builder(
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
                      child: Align(
                        alignment: LocalizationUtils.currentLocalIsAr()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: SizedBox(
                          height: AppSize.s50,
                          child: CategoryItem(
                            isActive: activeIndex == index,
                            categoryItemEntity: CategoryItemEntity.items[index],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
