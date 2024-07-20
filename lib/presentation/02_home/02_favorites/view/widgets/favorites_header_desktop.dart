import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/styles_manager.dart';

class FavoriteScreenHeaderDesktop extends StatelessWidget {
  const FavoriteScreenHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.Favorites,
          style: Styles.style36Medium(),
        ),
      ],
    );
  }
}
