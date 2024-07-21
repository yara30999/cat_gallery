import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class FavoriteScreenHeader extends StatelessWidget {
  const FavoriteScreenHeader({super.key, required this.headerStyle});
  final TextStyle headerStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.Favorites,
          style: headerStyle,
        ),
      ],
    );
  }
}
