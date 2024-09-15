import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../data/request_body/vote_body.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/post_vote_usecase.dart';

part 'post_vote_state.dart';

class PostVoteCubit extends Cubit<PostVoteState> {
  final PostVoteUsecase _postVoteUsecase;
  PostVoteCubit(this._postVoteUsecase) : super(const PostVoteInitial(null));

  Future<void> postVote({required VoteBody voteBody}) async {
    emit(const PostVoteLoading(null));
    var result = await _postVoteUsecase.execute(voteBody);
    result.fold((failure) async {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(PostVoteFailure(null, errMessage: errMessage));
    }, (voteSuccess) async {
      emit(PostVoteSuccess(voteSuccess));
    });
  }
}
