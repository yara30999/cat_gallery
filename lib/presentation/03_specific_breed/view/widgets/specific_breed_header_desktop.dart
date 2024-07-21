import 'package:flutter/material.dart';
import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';

class SpecificBreedHeaderDesktop extends StatelessWidget {
  const SpecificBreedHeaderDesktop({super.key, required this.catBreedEntity});
  final CatBreedEntity catBreedEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.breed_cat_images(catBreedEntity.name),
            style: Styles.style36Medium(),
          ),
        ),
      ],
    );
  }
}
