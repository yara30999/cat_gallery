import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../02_home/widgets/cat_image_with_click_options.dart';
import '../../../resources/values_manager.dart';

class SpecificBreedGridBuilder extends StatelessWidget {
  const SpecificBreedGridBuilder({super.key});
// replace with any entity according to the logic requirements in future...
  List<CatBreedCardEntity> get items => [
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_1.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_2.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_3.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_4.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_5.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_6.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_7.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_8.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_9.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_10.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_1.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_2.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_3.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_4.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_5.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_6.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_7.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_8.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_9.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_10.png'),
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
          catBreedCard: items[index],
        );
      },
    );
  }
}
