import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../resources/values_manager.dart';
import '../../../widgets/cat_image_with_click_options_and_date.dart';

class VotesGridBuilder extends StatelessWidget {
  const VotesGridBuilder({super.key});
// replace with any entity according to the logic requirements in future...
  List<CatWithClickEntity> get items => [
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: 5),
            categories: [Category(id: '1252525666', name: 'hats')],
            createdAt: '2024-07-18T11:06:27.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: 9),
            categories: null,
            createdAt: '2024-07-16T13:53:34.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: -4),
            categories: null,
            createdAt: '2024-06-26T09:20:11.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: null,
            vote: null,
            categories: [Category(id: '1252525666', name: 'hats')],
            createdAt: '2024-07-19T05:14:08.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: null,
            vote: null,
            categories: null,
            createdAt: '2024-07-19T02:02:35.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
            favorite: null,
            vote: null,
            categories: null,
            createdAt: '2024-07-19T09:06:35.000Z'),
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
