import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'sort_popup_menu.dart';

class RandomBreedHeader extends StatelessWidget {
  const RandomBreedHeader({
    super.key,
    required this.headerStyle,
  });
  final TextStyle headerStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.random_cat_images,
          style: headerStyle,
        ),
        const SortPopupMenu(),
      ],
    );
  }
}
