import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../02_home/view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import '../../resources/language_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/category_section.dart';
import 'widgets/random_breed_grid_builder.dart';
import 'widgets/random_breed_header.dart';

class RandomBreedBodyMobile extends StatelessWidget {
  const RandomBreedBodyMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:
          context.read<BottomScrollControllersCubit>().bottomScrollController,
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: RandomBreedHeader(
              headerStyle: Styles.style18Medium(),
            ),
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
