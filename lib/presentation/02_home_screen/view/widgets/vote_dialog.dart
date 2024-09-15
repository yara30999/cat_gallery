import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/functions.dart';
import '../../../../data/request_body/vote_body.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../04_votes/view_model/add_vote_cubit/post_vote_cubit.dart';
import 'vote_selector_button.dart';

class VoteDialog extends StatelessWidget {
  final CatWithClickEntity? catWithClickEntity;
  final GlobalKey<VoteSelectorButtonState> _voteSelectorKey =
      GlobalKey<VoteSelectorButtonState>();
  VoteDialog({
    super.key,
    required this.catWithClickEntity,
  });

  void _onVotePress(BuildContext context, String uid) {
    VoteBody body = VoteBody(
        imageId: catWithClickEntity!.imageId,
        subId: uid,
        value: _voteSelectorKey.currentState?.voteValue ?? 0);

    BlocProvider.of<PostVoteCubit>(context).postVote(voteBody: body);
  }

  @override
  Widget build(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          VoteSelectorButton(
            voteKey: _voteSelectorKey,
            vote: catWithClickEntity?.vote,
          ),
          const SizedBox(height: 20),
          BlocConsumer<PostVoteCubit, PostVoteState>(
            listener: (BuildContext context, PostVoteState state) {
              if (state is PostVoteSuccess) {
                var voteData = state.voteData;
                Navigator.of(context).pop(voteData);
              }
              if (state is PostVoteFailure) {
                var voteData = state.voteData;
                showSnakBar(context, state.errMessage);
                Navigator.of(context).pop(voteData);
              }
            },
            builder: (context, state) {
              if (state is PostVoteLoading) {
                return ElevatedButton(
                  onPressed: null,
                  child: Text(S.current.loading),
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    _onVotePress(context, uid);
                  },
                  child: Text(S.current.Vote),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
