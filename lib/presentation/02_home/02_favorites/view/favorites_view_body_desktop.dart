import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'widgets/favorites_grid_builder.dart';
import 'widgets/favorites_header.dart';

class FavoritesViewBodyDesktop extends StatelessWidget {
  final ScrollController? favoratesScreenScrollController;
  const FavoritesViewBodyDesktop(
      {super.key, required this.favoratesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: favoratesScreenScrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            right: AppSize.s60,
            left: AppSize.s60,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: FavoriteScreenHeader(
              headerStyle: Styles.style36Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p340,
            vertical: AppPadding.p20,
          ),
          sliver: FavoritesGridBuilder(),
        ),
      ],
    );
  }
}
