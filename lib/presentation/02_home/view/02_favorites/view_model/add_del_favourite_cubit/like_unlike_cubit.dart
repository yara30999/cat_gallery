import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/request_body/favourite_body.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/delete_favourite_usecase.dart';
import '../../../../../../domain/usecase/post_favourite_usecase.dart';

part 'like_unlike_state.dart';

class LikeUnlikeCubit extends Cubit<LikeUnlikeState> {
  final PostFavouriteUsecase _postFavouriteUsecase;
  final DeleteFavouriteUsecase _deleteFavouriteUsecase;
  LikeUnlikeCubit(this._postFavouriteUsecase, this._deleteFavouriteUsecase)
      : super(const LikeUnlikeInitial(null));

  Future<void> like({required FavouriteBody favouriteBody}) async {
    emit(const LikeUnlikeLoading(null));
    var result = await _postFavouriteUsecase.execute(favouriteBody);
    result.fold((failure) async {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(LikeUnlikeFailure(null, errMessage: errMessage));
    }, (favouriteSucces) async {
      emit(LikeUnlikeSuccess(favouriteSucces));
    });
  }

  Future<void> unlike({required String uid, required String favId}) async {
    emit(const LikeUnlikeLoading(null));
    var result = await _deleteFavouriteUsecase
        .execute(DeleteFavouriteUseCaseInput(uid, favId));
    result.fold((failure) async {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(LikeUnlikeFailure(null, errMessage: errMessage));
    }, (success) async {
      //emit null obj to show that favourite has been deleted
      emit(const LikeUnlikeSuccess(null));
    });
  }
}
