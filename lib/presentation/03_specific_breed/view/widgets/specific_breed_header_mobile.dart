import 'package:flutter/material.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import 'specific_breed_bar_graph.dart';
import 'specific_breed_info.dart';

class SpecificBreedHeaderMobile extends StatelessWidget {
  final CatBreedEntity catBreedEntity;
  const SpecificBreedHeaderMobile({
    super.key,
    required this.catBreedEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.breed_cat_images(catBreedEntity.name),
            style: Styles.style18Medium(),
          ),
        ),
        SpecificBreedInformation(
          catBreedEntity: catBreedEntity,
          baseTextStyle: Styles.style16Medium().copyWith(
              color: isLightTheme(context)
                  ? ColorManager.black
                  : ColorManager.white),
        ),
        SpecificBreedBarGraph(
          catBreedEntity: catBreedEntity,
          labelsStyle: Styles.style16Medium(),
        ),
      ],
    );
  }
}
