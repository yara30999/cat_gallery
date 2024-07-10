import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import 'vote_selector_button.dart';

class VoteDialog extends StatelessWidget {
  const VoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          const VoteSelectorButton(),
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
