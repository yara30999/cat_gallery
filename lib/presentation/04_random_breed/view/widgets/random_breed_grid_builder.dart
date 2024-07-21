import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../resources/values_manager.dart';
import '../../../02_home/widgets/cat_image_with_click_options.dart';

class RandomBreedGridBuilder extends StatelessWidget {
  const RandomBreedGridBuilder({
    super.key,
  });
  // replace with any entity according to the logic requirements in future...
  List<CatWithClickEntity> get items => [
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: Vote(id: '252536945', value: 5),
            categories: [Category(id: '1252525666', name: 'hats')],
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: 9),
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: Vote(id: '252536945', value: -4),
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: null,
            categories: [Category(id: '1252525666', name: 'hats')],
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: null,
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: null,
            categories: null,
            createdAt: null),
      ];

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      childCount: items.length,
      mainAxisSpacing: AppPadding.p20,
      crossAxisSpacing: AppPadding.p10,
      crossAxisCount: 1,
      itemBuilder: (context, index) {
        return CatImageWithClickOptions(
          catWithClickEntity: items[index],
        );
      },
    );
  }
}
