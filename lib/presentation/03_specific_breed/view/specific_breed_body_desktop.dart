import 'package:flutter/material.dart';
import '../../../app/functions.dart';
import '../../../domain/entities/cat_breed_entity.dart';
import '../../02_home/widgets/persistenet_header.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/specific_breed_bar_graph.dart';
import 'widgets/specific_breed_grid_builder.dart';
import 'widgets/specific_breed_header_desktop.dart';
import 'widgets/specific_breed_info.dart';

class SpecificBreedBodyDesktop extends StatelessWidget {
  final ScrollController? specificBreedScreenScrollController;
  const SpecificBreedBodyDesktop({
    super.key,
    required this.specificBreedScreenScrollController,
  });

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 8,
          fit: FlexFit.loose,
          child: ImagesBody(
              specificBreedScreenScrollController:
                  specificBreedScreenScrollController,
              dummyCatBreed: dummyCatBreed),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: InformationBody(dummyCatBreed: dummyCatBreed),
        ),
      ],
    );
  }
}

class ImagesBody extends StatelessWidget {
  const ImagesBody({
    super.key,
    required this.specificBreedScreenScrollController,
    required this.dummyCatBreed,
  });

  final ScrollController? specificBreedScreenScrollController;
  final CatBreedEntity dummyCatBreed;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: specificBreedScreenScrollController,
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: SpecificBreedHeaderDesktop(
              catBreedEntity: dummyCatBreed,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p130, //340
            vertical: AppPadding.p20,
          ),
          sliver: SpecificBreedGridBuilder(),
        ),
      ],
    );
  }
}

class InformationBody extends StatelessWidget {
  const InformationBody({
    super.key,
    required this.dummyCatBreed,
  });

  final CatBreedEntity dummyCatBreed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                child: SpecificBreedInformation(
                  catBreedEntity: dummyCatBreed,
                  baseTextStyle: Styles.style16Medium().copyWith(
                      color: isLightTheme(context)
                          ? ColorManager.black
                          : ColorManager.white),
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                child: AspectRatio(
                  aspectRatio: 2 / 1.8,
                  child: SpecificBreedBarGraph(
                    catBreedEntity: dummyCatBreed,
                    labelsStyle: Styles.style12Medium(),
                    barWidth: AppSize.s11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
