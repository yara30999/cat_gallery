import 'package:flutter/material.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import 'specific_breed_bar_graph.dart';
import 'specific_breed_info.dart';

class SpecificBreedHeaderMobile extends StatelessWidget {
  const SpecificBreedHeaderMobile({super.key});

  CatBreedEntity get dummyCatBreed => const CatBreedEntity(
      weight: Weight(imperial: '7 - 10', metric: '3 - 5'),
      id: 'Abys',
      name: 'Abyssinian',
      vetstreetUrl: 'http://www.vetstreet.com/cats/abyssinian',
      wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
      temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
      origin: 'Egypt',
      description:
          'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
      lifeSpan: '14 - 15',
      adaptability: 5,
      affectionLevel: 3,
      childFriendly: 3,
      dogFriendly: 4,
      energyLevel: 5,
      grooming: 2,
      healthIssues: 1,
      intelligence: 5,
      sheddingLevel: 3,
      socialNeeds: 4,
      strangerFriendly: 5,
      referenceImageId: '0XYvRd7oD');

  // CatBreedEntity get dummyCatBreed => CatBreedEntity(
  //     weight: Weight(imperial: '7 - 10', metric: '3 - 5'),
  //     id: 'Abys',
  //     name: 'حبشي',
  //     vetstreetUrl: 'http://www.vetstreet.com/cats/abyssinian',
  //     wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
  //     temperament: 'نشط، حيوي، مستقل، ذكي، لطيف',
  //     origin: 'مصر',
  //     description:
  //         'القط الحبشي سهل العناية به ووجوده في المنزل متعة. هم قطط حنونة ويحبون الناس والحيوانات الأخرى.',
  //     lifeSpan: '14 - 15',
  //     adaptability: 5,
  //     affectionLevel: 3,
  //     childFriendly: 3,
  //     dogFriendly: 4,
  //     energyLevel: 5,
  //     grooming: 2,
  //     healthIssues: 1,
  //     intelligence: 5,
  //     sheddingLevel: 3,
  //     socialNeeds: 4,
  //     strangerFriendly: 5,
  //     referenceImageId: '0XYvRd7oD');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.breed_cat_images(dummyCatBreed.name),
            style: Styles.style18Medium(),
          ),
        ),
        SpecificBreedInformation(
          catBreedEntity: dummyCatBreed,
          baseTextStyle: Styles.style16Medium().copyWith(
              color: isLightTheme(context)
                  ? ColorManager.black
                  : ColorManager.white),
        ),
        SpecificBreedBarGraph(
          catBreedEntity: dummyCatBreed,
          labelsStyle: Styles.style16Medium(),
        ),
      ],
    );
  }
}
