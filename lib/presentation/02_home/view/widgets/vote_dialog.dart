import 'package:flutter/material.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../generated/l10n.dart';
import 'vote_selector_button.dart';

class VoteDialog extends StatelessWidget {
  final Vote? vote;
  const VoteDialog({
    super.key,
    required this.vote,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          VoteSelectorButton(
            vote: vote,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle vote action before dismiss
              Navigator.of(context).pop();
              //you can show happy or sad after voting using lotti files
            },
            child: Text(S.current.Vote),
          ),
        ],
      ),
    );
  }
}
