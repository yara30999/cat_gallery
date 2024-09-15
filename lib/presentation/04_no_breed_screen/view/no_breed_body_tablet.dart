import 'package:flutter/material.dart';
import '../../02_home_screen/view/widgets/persistenet_header.dart';
import '../../resources/language_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'bloc_builder/no_breed_bloc_consumer.dart';
import 'widgets/category_section.dart';
import 'widgets/no_breed_header.dart';

class NoBreedBodyTablet extends StatelessWidget {
  const NoBreedBodyTablet({
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
            child: NoBreedHeader(
              headerStyle: Styles.style22Medium(),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
              right:
                  LocalizationUtils.currentLocalIsAr() ? AppPadding.p20 : 0.0,
              left:
                  LocalizationUtils.currentLocalIsAr() ? 0.0 : AppPadding.p20),
          sliver: const SliverToBoxAdapter(
            child: CategorySection(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: NoBreedBlocConsumer(),
        ),
      ],
    );
  }
}
