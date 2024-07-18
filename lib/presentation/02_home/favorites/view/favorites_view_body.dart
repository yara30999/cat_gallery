import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'favorites_grid_builder.dart';
import 'favorites_header.dart';

class FavoritesViewBody extends StatelessWidget {
  final ScrollController? favoratesScreenScrollController;
  const FavoritesViewBody(
      {super.key, required this.favoratesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: favoratesScreenScrollController,
      slivers: const [
        PersistentAppBar(),
        SliverPadding(
          padding: EdgeInsets.only(
            right: AppSize.s16,
            left: AppSize.s16,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: FavoriteScreenHeader(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: FavoritesGridBuilder(),
        ),
      ],
    );
  }
}
