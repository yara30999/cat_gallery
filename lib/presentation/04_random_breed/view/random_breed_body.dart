import 'package:flutter/material.dart';
import '../../02_home/widgets/custom_app_bar.dart';
import '../../resources/language_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/category_section.dart';
import 'widgets/random_breed_grid_builder.dart';
import 'widgets/random_breed_header.dart';

class RandomBreedBody extends StatelessWidget {
  final ScrollController? randomBreedScreenScrollController;
  const RandomBreedBody({
    super.key,
    required this.randomBreedScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: randomBreedScreenScrollController,
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
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: RandomBreedGridBuilder(),
        ),
      ],
    );
  }
}
