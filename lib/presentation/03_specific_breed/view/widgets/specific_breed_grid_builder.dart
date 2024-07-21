import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../02_home/widgets/cat_image_with_click_options.dart';
import '../../../resources/values_manager.dart';

class SpecificBreedGridBuilder extends StatelessWidget {
  const SpecificBreedGridBuilder({super.key});
// replace with any entity according to the logic requirements in future...
  List<CatWithClickEntity> get items => [
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://images.pexels.com/photos/326875/pexels-photo-326875.jpeg?cs=srgb&dl=adorable-animal-blur-326875.jpg&fm=jpg",
            favorite: Favorite(id: '1234567555'),
            vote: Vote(id: '252536945', value: 5),
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzdWHcffKPDbUMWEVLor3x7sknODQ7SP-Qmw&s",
            favorite: null,
            vote: Vote(id: '252536945', value: 9),
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://th.bing.com/th/id/OIP.XgYNEaDoZZteH9cOcEcutAHaE9?w=1920&h=1285&rs=1&pid=ImgDetMain",
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
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://th.bing.com/th/id/R.7f9f4e77e7173103994679909a4b53c6?rik=OVKjg3yCUVYuKw&pid=ImgRaw&r=0",
            favorite: null,
            vote: null,
            categories: null,
            createdAt: null),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
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
