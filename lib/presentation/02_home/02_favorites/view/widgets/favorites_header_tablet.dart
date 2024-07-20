import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/styles_manager.dart';

class FavoriteScreenHeaderTablet extends StatelessWidget {
  const FavoriteScreenHeaderTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.Favorites,
          style: Styles.style22Medium(),
        ),
      ],
    );
  }
}
