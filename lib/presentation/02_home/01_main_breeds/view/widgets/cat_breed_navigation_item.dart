import 'package:flutter/material.dart';

import '../../../../../domain/entities/cat_breed_card.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class CatBreedNavigationItem extends StatelessWidget {
  final CatBreedCardEntity catBreedCard;

  const CatBreedNavigationItem({
    super.key,
    required this.catBreedCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.specificBreedRoute,
        );
      },
      child: Material(
        elevation: AppSize.s8,
        borderRadius: BorderRadius.circular(AppSize.s28),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).disabledColor,
        child: Column(
          children: [
            Image.asset(
              catBreedCard.referenceImgurl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(catBreedCard.breedName,
                  textAlign: TextAlign.center,
                  style:
                      Styles.style18Bold().copyWith(color: ColorManager.white)),
            ),
          ],
        ),
      ),
    );
  }
}
