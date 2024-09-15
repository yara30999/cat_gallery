import 'package:flutter/material.dart';
import 'specific_breed_bar_graph.dart';
import 'specific_breed_info.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class InformationDesktopBody extends StatelessWidget {
  const InformationDesktopBody({
    super.key,
    required this.catBreedEntity,
  });

  final CatBreedEntity catBreedEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
              child: SpecificBreedInformation(
                catBreedEntity: catBreedEntity,
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
                  catBreedEntity: catBreedEntity,
                  labelsStyle: Styles.style12Medium(),
                  barWidth: AppSize.s11,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
