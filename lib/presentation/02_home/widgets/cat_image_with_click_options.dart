import 'package:flutter/material.dart';
import '../../../domain/entities/cat_breed_card.dart';
import '../../resources/routes_manager.dart';
import 'pinch_zoom_image.dart';
import '../../resources/values_manager.dart';
import 'action_button.dart';
import 'favorite_button.dart';
import 'vote_dialog.dart';

class CatImageWithClickOptions extends StatelessWidget {
  final CatBreedCardEntity catBreedCard;

  const CatImageWithClickOptions({
    super.key,
    required this.catBreedCard,
  });

  void _voteButtonOnPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const VoteDialog(),
    );
  }

  void _analysisButtonOnPress(BuildContext context) {
    Navigator.pushNamed(context, Routes.analysisRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s8,
      child: Column(
        children: [
          // form assets, use cashed network image here
          PinchZoomImage(
            assetName: catBreedCard.referenceImgurl,
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
          onPressed: () {
            _voteButtonOnPress(context);
          },
        ),
        ActionButton(
          icon: Icons.science_outlined,
          onPressed: () {
            _analysisButtonOnPress(context);
          },
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
