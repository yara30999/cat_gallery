import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../app/extensions.dart';
import '../../domain/entities/category_item.dart';
import '../../generated/l10n.dart';
import '../02_home/widgets/custom_app_bar.dart';
import '../resources/color_manager.dart';
import '../resources/language_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class RandomBreedBody extends StatefulWidget {
  final ScrollController randomBreedScreenScrollController;
  const RandomBreedBody({
    super.key,
    required this.randomBreedScreenScrollController,
  });

  @override
  State<RandomBreedBody> createState() => _RandomBreedBodyState();
}

class _RandomBreedBodyState extends State<RandomBreedBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.randomBreedScreenScrollController,
      slivers: [
        const PersistentAppBar(),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p10),
          sliver: SliverToBoxAdapter(
            child: RandomBreedHeader(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
              right:
                  LocalizationUtils.currentLocalIsAr() ? AppPadding.p16 : 0.0,
              left:
                  LocalizationUtils.currentLocalIsAr() ? 0.0 : AppPadding.p16),
          sliver: const SliverToBoxAdapter(
            child: CategorySection(),
          ),
        ),
      ],
    );
  }
}

class RandomBreedHeader extends StatefulWidget {
  const RandomBreedHeader({
    super.key,
  });

  @override
  State<RandomBreedHeader> createState() => _RandomBreedHeaderState();
}

class _RandomBreedHeaderState extends State<RandomBreedHeader> {
  SortingItem? selectedSortingItem = SortingItem.asc;
  List<PopupMenuItem<SortingItem>> sortItems =
      SortingItem.values.map((SortingItem sortingItem) {
    return PopupMenuItem<SortingItem>(
      value: sortingItem,
      child: Text(sortingItem.displayValue),
    );
  }).toList();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Rebuild the sort items when dependencies change, like locale
    sortItems = SortingItem.values.map((SortingItem sortingItem) {
      return PopupMenuItem<SortingItem>(
        value: sortingItem,
        child: Text(sortingItem.displayValue),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.random_cat_images,
          style: Styles.style36Medium(context),
        ),
        PopupMenuButton<SortingItem>(
          icon: const Icon(Icons.filter_alt_outlined),
          initialValue: selectedSortingItem,
          itemBuilder: (BuildContext context) => sortItems,
          popUpAnimationStyle: AnimationStyle(
              curve: Curves.linear,
              reverseCurve: Curves.linear,
              duration: const Duration(milliseconds: 700),
              reverseDuration: const Duration(milliseconds: 700)),
          onSelected: (SortingItem value) {
            //print('Selected: ${value.displayValue}');
            setState(() {
              selectedSortingItem = value;
            });
          },
        )
      ],
    );
  }
}

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
      height: MediaQuery.of(context).size.height * .06,
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
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isActive,
    required this.categoryItemEntity,
  });

  final bool isActive;
  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      duration: const Duration(milliseconds: 700),
      firstChild: SizedBox(
          height: MediaQuery.of(context).size.height * .05,
          child: ActiveCatigoryItem(categoryItemEntity: categoryItemEntity)),
      secondChild: SizedBox(
          height: MediaQuery.of(context).size.height * .05,
          child: InActiveCatigoryItem(categoryItemEntity: categoryItemEntity)),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class ActiveCatigoryItem extends StatelessWidget {
  const ActiveCatigoryItem({
    super.key,
    required this.categoryItemEntity,
  });
  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s4,
      borderRadius: BorderRadius.circular(AppSize.s8),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).disabledColor,
      child: Row(
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
                style: Styles.style18Bold(context)
                    .copyWith(color: ColorManager.white)),
          ),
          const SizedBox(
            width: AppSize.s5,
          )
        ],
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
    return Material(
      elevation: AppSize.s4,
      borderRadius: BorderRadius.circular(AppSize.s8),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).unselectedWidgetColor,
      child: Row(
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
                style: Styles.style18Bold(context)
                    .copyWith(color: ColorManager.black)),
          ),
          const SizedBox(
            width: AppSize.s5,
          )
        ],
      ),
    );
  }
}
