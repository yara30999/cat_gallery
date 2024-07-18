import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/cat_image_with_click_options_and_date.dart';

class FavoritesGridBuilder extends StatelessWidget {
  const FavoritesGridBuilder({super.key});
// replace with any entity according to the logic requirements in future...
  List<CatWithClickEntity> get items => [
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: Vote(id: '252536945', value: 5),
            categories: [Category(id: '1252525666', name: 'hats')],
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: Vote(id: '252536945', value: 9),
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: Vote(id: '252536945', value: -4),
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: null,
            categories: [Category(id: '1252525666', name: 'hats')],
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: Favorite(id: '1234567555'),
            vote: null,
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: Favorite(id: '1234567555'),
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
        return Column(
          children: [
            CatImageWithClickOptionsAndDate(
              catWithClickEntity: items[index],
            ),
          ],
        );
      },
    );
  }
}
