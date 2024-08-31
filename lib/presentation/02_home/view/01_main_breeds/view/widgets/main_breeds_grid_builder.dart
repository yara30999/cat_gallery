import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../../domain/entities/cat_breed_card.dart';
import '../../../../../resources/values_manager.dart';
import 'cat_breed_navigation_item.dart';

class MainBreedsGridBuilder extends StatelessWidget {
  const MainBreedsGridBuilder({
    super.key,
    required this.columnNumbers,
    required this.items,
  });
  final int columnNumbers;
  final List<CatBreedCardEntity> items;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      shrinkWrap: true,
      mainAxisSpacing: AppPadding.p20,
      crossAxisSpacing: AppPadding.p10,
      crossAxisCount: columnNumbers,
      itemBuilder: (context, index) {
        return CatBreedNavigationItem(
          catBreedCard: items[index],
        );
      },
    );
  }
}
