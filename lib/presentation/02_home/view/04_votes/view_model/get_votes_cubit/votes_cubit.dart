import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/get_votes_usecase.dart';
import '../../../../../../generated/l10n.dart';

part 'votes_state.dart';

class VotesCubit extends Cubit<VotesState> {
  final GetVotesUsecase _getVotesUsecase;
  List<CatWithClickEntity> items = [];
  VotesCubit(
    this._getVotesUsecase,
  ) : super(const VotesInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    items = generateDummyCatImagesList();
  }

  Future<void> getVotes({required String uid, required int pageNum}) async {
    if (pageNum == 0) {
      emit(VotesLoading(items, isLoading: true));
    } else {
      emit(VotesPaginationLoading(items, isLoading: false));
    }

    var result =
        await _getVotesUsecase.execute(VotesUseCaseInput(uid, pageNum));

    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      if (pageNum == 0) {
        emit(VotesFailure(items, errMessage, isLoading: false));
      } else {
        emit(VotesPaginationFailure(items, errMessage, isLoading: false));
      }
    }, (catImagesSuccess) {
      if (pageNum == 0) {
        if (catImagesSuccess.isEmpty) {
          emit(VotesSuccessFirstPageEmpty(items, isLoading: false));
        } else {
          items.clear();
          items.addAll(catImagesSuccess);
          emit(VotesSuccess(items, isLoading: false));
        }
      } else {
        if (catImagesSuccess.isEmpty) {
          var errMessage = S.current.no_more_cat_images;
          emit(VotesPaginationFailure(items, errMessage, isLoading: false));
        } else {
          items.addAll(catImagesSuccess);
          emit(VotesPaginationSuccess(items, isLoading: false));
        }
      }
    });
  }
}
