import 'package:flutter/material.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../resources/values_manager.dart';
import 'action_button.dart';
import 'favorite_button.dart';

class CatImageWithClickOptions extends StatelessWidget {
  final CatBreedCardEntity catBreedCard;

  const CatImageWithClickOptions({
    super.key,
    required this.catBreedCard,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s8,
      child: Column(
        children: [
          Image.asset(
            catBreedCard.referenceImgurl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FavoriteButton(
          onPressed: () {},
        ),
        ActionButton(
          icon: Icons.how_to_vote_outlined,
          onPressed: () {},
        ),
        ActionButton(
          icon: Icons.science_outlined,
          onPressed: () {},
        ),
        const Spacer(),
        ActionButton(
          icon: Icons.save_alt,
          onPressed: () {},
        ),
      ],
    );
  }
}
