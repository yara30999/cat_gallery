import 'package:flutter/material.dart';
import '../../../domain/entities/cat_with_click_entity.dart';
import '../../resources/platform_manager.dart';
import '../../resources/routes_manager.dart';
import 'images_widgets/cat_cashed_image.dart';
import 'images_widgets/cat_network_image.dart';
import 'images_widgets/cat_pinch_zoom_image.dart';
import '../../resources/values_manager.dart';
import 'action_button.dart';
import 'favorite_button.dart';
import 'vote_dialog.dart';

class CatImageWithClickOptions extends StatelessWidget {
  final CatWithClickEntity catWithClickEntity;

  const CatImageWithClickOptions({
    super.key,
    required this.catWithClickEntity,
  });

  void _voteButtonOnPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => VoteDialog(
        vote: catWithClickEntity.vote,
      ),
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
          DeviceWidget(
              androidIos: (context) => CatPinchZoomImage(
                    assetName: catWithClickEntity.imageUrl,
                  ),
              web: (context) =>
                  CatNetworkImage(imgUrl: catWithClickEntity.imageUrl),
              desktop: (context) =>
                  CatCashedImage(imgUrl: catWithClickEntity.imageUrl)),
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
          favorite: catWithClickEntity.favorite,
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
