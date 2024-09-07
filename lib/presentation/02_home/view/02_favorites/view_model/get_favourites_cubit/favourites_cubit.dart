import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/get_favourites_usecase.dart';
import '../../../../../../generated/l10n.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final GetFavouritesUsecase _getFavouritesUsecase;
  List<CatWithClickEntity> items = [];
  FavouritesCubit(this._getFavouritesUsecase)
      : super(const FavouritesInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    items = generateDummyCatImagesList();
  }

  Future<void> getFavourites(
      {required String uid, required int pageNum}) async {
    if (pageNum == 0) {
      emit(FavouritesLoading(items, isLoading: true));
    } else {
      emit(FavouritesPaginationLoading(items, isLoading: false));
    }

    var result = await _getFavouritesUsecase
        .execute(FavouritesUseCaseInput(uid, pageNum));

    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      if (pageNum == 0) {
        emit(FavouritesFailure(items, errMessage, isLoading: false));
      } else {
        emit(FavouritesPaginationFailure(items, errMessage, isLoading: false));
      }
    }, (catImagesSuccess) {
      if (pageNum == 0) {
        if (catImagesSuccess.isEmpty) {
          emit(FavouritesSuccessFirstPageEmpty(items, isLoading: false));
        } else {
          items.clear();
          items.addAll(catImagesSuccess);
          emit(FavouritesSuccess(items, isLoading: false));
        }
      } else {
        if (catImagesSuccess.isEmpty) {
          var errMessage = S.current.no_more_cat_images;
          emit(
              FavouritesPaginationFailure(items, errMessage, isLoading: false));
        } else {
          items.addAll(catImagesSuccess);
          emit(FavouritesPaginationSuccess(items, isLoading: false));
        }
      }
    });
  }
}
