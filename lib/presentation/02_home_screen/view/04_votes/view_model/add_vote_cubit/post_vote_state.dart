part of 'post_vote_cubit.dart';

@immutable
sealed class PostVoteState {
  final Vote? voteData;
  const PostVoteState(this.voteData);
}

final class PostVoteInitial extends PostVoteState {
  const PostVoteInitial(super.voteData);
}

class PostVoteLoading extends PostVoteState {
  const PostVoteLoading(super.voteData);
}

class PostVoteFailure extends PostVoteState {
  final String errMessage;

  const PostVoteFailure(super.voteData, {required this.errMessage});
}

class PostVoteSuccess extends PostVoteState {
  const PostVoteSuccess(super.voteData);
}
