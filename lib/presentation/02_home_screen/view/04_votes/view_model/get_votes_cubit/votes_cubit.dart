import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/get_votes_usecase.dart';
import '../../../../../../generated/l10n.dart';

part 'votes_state.dart';

class VotesCubit extends Cubit<VotesState> {
  final GetVotesUsecase _getVotesUsecase;
  List<CatWithClickEntity> _items = [];
  VotesCubit(
    this._getVotesUsecase,
  ) : super(const VotesInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    _items = generateDummyCatImagesList();
  }

  Future<void> getVotes({required String uid, required int pageNum}) async {
    if (pageNum == 0) {
      emit(VotesLoading(_items, isLoading: true));
    } else {
      emit(VotesPaginationLoading(_items, isLoading: false));
    }

    var result =
        await _getVotesUsecase.execute(VotesUseCaseInput(uid, pageNum));

    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      if (pageNum == 0) {
        emit(VotesFailure(_items, errMessage, isLoading: false));
      } else {
        emit(VotesPaginationFailure(_items, errMessage, isLoading: false));
      }
    }, (catImagesSuccess) {
      if (pageNum == 0) {
        if (catImagesSuccess.isEmpty) {
          emit(VotesSuccessFirstPageEmpty(_items, isLoading: false));
        } else {
          _items.clear();
          _items.addAll(catImagesSuccess);
          emit(VotesSuccess(_items, isLoading: false));
        }
      } else {
        if (catImagesSuccess.isEmpty) {
          var errMessage = S.current.no_more_cat_images;
          emit(VotesPaginationFailure(_items, errMessage, isLoading: false));
        } else {
          _items.addAll(catImagesSuccess);
          emit(VotesPaginationSuccess(_items, isLoading: false));
        }
      }
    });
  }
}
