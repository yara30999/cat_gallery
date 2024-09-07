import 'package:flutter/material.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import 'bloc_builders/favourites_bloc_consumer.dart';
import 'widgets/favorites_header.dart';

class FavoritesViewBodyTablet extends StatelessWidget {
  const FavoritesViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            right: AppSize.s40,
            left: AppSize.s40,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: FavoriteScreenHeader(
              headerStyle: Styles.style22Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: FavouritesBlocConsumer(),
        ),
      ],
    );
  }
}
