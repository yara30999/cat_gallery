import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/favorites_grid_builder.dart';
import 'widgets/favorites_header_desktop.dart';

class FavoritesViewBodyDesktop extends StatelessWidget {
  final ScrollController? favoratesScreenScrollController;
  const FavoritesViewBodyDesktop(
      {super.key, required this.favoratesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: favoratesScreenScrollController,
      slivers: const [
        SliverPadding(
          padding: EdgeInsets.only(
            right: AppSize.s60,
            left: AppSize.s60,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: FavoriteScreenHeaderDesktop(),
          ),
        ),
        SliverPadding(
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
