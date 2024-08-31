import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';

class VotesScreenHeader extends StatelessWidget {
  const VotesScreenHeader({
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
          S.current.Votes,
          style: headerStyle,
        ),
      ],
    );
  }
}
