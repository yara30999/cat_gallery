import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/styles_manager.dart';

class VotesScreenHeaderDesktop extends StatelessWidget {
  const VotesScreenHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.Votes,
          style: Styles.style36Medium(),
        ),
      ],
    );
  }
}
