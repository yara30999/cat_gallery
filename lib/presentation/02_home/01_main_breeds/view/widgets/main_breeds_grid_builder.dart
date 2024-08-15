import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../domain/entities/cat_breed_card.dart';
import '../../../../resources/values_manager.dart';
import 'cat_breed_navigation_item.dart';

class MainBreedsGridBuilder extends StatelessWidget {
  const MainBreedsGridBuilder({
    super.key,
    required this.columnNumbers,
  });
  final int columnNumbers;

  // TODO: 2 we should get the actual breed list (items) from the api...
  // instead of doing (static final List<CatBreedCardInfo> items = [];)
  List<CatBreedCardEntity> get items => [
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkL4WZvGAk07aV5n1YRnUnR0xGmciI1FLLZw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/view-adorable-kitten-with-simple-background_23-2150758096.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb46yMlhCLz10FwZi9-hn_NjCeEZz-ORHgyQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://wallpapers.com/images/featured/cat-g9rdx9uk2425fip2.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl:
                'https://www.shutterstock.com/image-photo/funny-british-shorthair-cat-portrait-600nw-2097266809.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHjQzMaiAHTUrzQAcq0hxckWeFKaMT-9UA3w&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI_75r6_muaRy2NP06PHHyD9ytNPGxxzLCBQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://hips.hearstapps.com/hmg-prod/images/cat-puns-64ef515f6036a.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31-OE4i9ST8qidcOnOnmfNJNHzfPfHWszGg&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkOVtFHrcLSL9qvZz8zXyiJjY-qCQsW_fuvw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://media.npr.org/assets/img/2023/12/12/gettyimages-1054147940-627235e01fb63b4644bec84204c259f0a343e35b.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpghttps://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkL4WZvGAk07aV5n1YRnUnR0xGmciI1FLLZw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/view-adorable-kitten-with-simple-background_23-2150758096.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb46yMlhCLz10FwZi9-hn_NjCeEZz-ORHgyQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://wallpapers.com/images/featured/cat-g9rdx9uk2425fip2.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl:
                'https://www.shutterstock.com/image-photo/funny-british-shorthair-cat-portrait-600nw-2097266809.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHjQzMaiAHTUrzQAcq0hxckWeFKaMT-9UA3w&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI_75r6_muaRy2NP06PHHyD9ytNPGxxzLCBQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://hips.hearstapps.com/hmg-prod/images/cat-puns-64ef515f6036a.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31-OE4i9ST8qidcOnOnmfNJNHzfPfHWszGg&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkOVtFHrcLSL9qvZz8zXyiJjY-qCQsW_fuvw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://media.npr.org/assets/img/2023/12/12/gettyimages-1054147940-627235e01fb63b4644bec84204c259f0a343e35b.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpghttps://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkL4WZvGAk07aV5n1YRnUnR0xGmciI1FLLZw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/view-adorable-kitten-with-simple-background_23-2150758096.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb46yMlhCLz10FwZi9-hn_NjCeEZz-ORHgyQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://wallpapers.com/images/featured/cat-g9rdx9uk2425fip2.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl:
                'https://www.shutterstock.com/image-photo/funny-british-shorthair-cat-portrait-600nw-2097266809.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHjQzMaiAHTUrzQAcq0hxckWeFKaMT-9UA3w&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI_75r6_muaRy2NP06PHHyD9ytNPGxxzLCBQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://hips.hearstapps.com/hmg-prod/images/cat-puns-64ef515f6036a.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31-OE4i9ST8qidcOnOnmfNJNHzfPfHWszGg&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkOVtFHrcLSL9qvZz8zXyiJjY-qCQsW_fuvw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://media.npr.org/assets/img/2023/12/12/gettyimages-1054147940-627235e01fb63b4644bec84204c259f0a343e35b.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpghttps://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkL4WZvGAk07aV5n1YRnUnR0xGmciI1FLLZw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/view-adorable-kitten-with-simple-background_23-2150758096.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb46yMlhCLz10FwZi9-hn_NjCeEZz-ORHgyQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://wallpapers.com/images/featured/cat-g9rdx9uk2425fip2.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl:
                'https://www.shutterstock.com/image-photo/funny-british-shorthair-cat-portrait-600nw-2097266809.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHjQzMaiAHTUrzQAcq0hxckWeFKaMT-9UA3w&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI_75r6_muaRy2NP06PHHyD9ytNPGxxzLCBQ&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://hips.hearstapps.com/hmg-prod/images/cat-puns-64ef515f6036a.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31-OE4i9ST8qidcOnOnmfNJNHzfPfHWszGg&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkOVtFHrcLSL9qvZz8zXyiJjY-qCQsW_fuvw&s'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl:
                'https://media.npr.org/assets/img/2023/12/12/gettyimages-1054147940-627235e01fb63b4644bec84204c259f0a343e35b.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl:
                'https://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpghttps://img.freepik.com/free-photo/adorable-cat-relaxing-indoors_23-2150692804.jpg'),
      ];

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      childCount: items.length,
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
