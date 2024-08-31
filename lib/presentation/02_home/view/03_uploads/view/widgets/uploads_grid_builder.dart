import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../resources/values_manager.dart';
import 'upload_image_with_click_options_and_date.dart';

class UploadsScreenGridBuilder extends StatelessWidget {
  const UploadsScreenGridBuilder({super.key});

// replace with any entity according to the logic requirements in future...
  List<CatWithClickEntity> get items => [
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: 5),
            categories: [Category(id: '1252525666', name: 'hats')],
            breedName: 'arabian mouarabian ',
            createdAt: '2024-07-18T11:06:27.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: 9),
            categories: null,
            breedName: 'arabian ',
            createdAt: '2024-07-16T13:53:34.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: Vote(id: '252536945', value: -4),
            createdAt: '2024-06-26T09:20:11.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: null,
            categories: [Category(id: '1252525666', name: 'hats')],
            breedName: 'arabian mou',
            createdAt: '2024-07-19T05:14:08.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: null,
            createdAt: '2024-07-19T02:02:35.000Z'),
        const CatWithClickEntity(
            imageId: '123456789',
            imageUrl:
                "https://t3.ftcdn.net/jpg/06/05/37/40/360_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg",
            favorite: null,
            vote: null,
            categories: [Category(id: '1252525666', name: 'hats')],
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
            UploadImageWithClickOptionsAndDate(
              catWithClickEntity: items[index],
            ),
          ],
        );
      },
    );
  }
}
