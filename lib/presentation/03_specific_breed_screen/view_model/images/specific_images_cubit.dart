import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../domain/usecase/get_breed_images_usecase.dart';
import '../../../../generated/l10n.dart';

part 'specific_images_state.dart';

class SpecificImagesCubit extends Cubit<SpecificImagesState> {
  final GetBreedImagesUsecase _getBreedImagesUsecase;
  List<CatWithClickEntity> items = [];

  SpecificImagesCubit(this._getBreedImagesUsecase)
      : super(const SpecificImagesInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    items = generateDummyCatImagesList();
  }

  Future<void> getBreedImages(
      {required String uid,
      required String? breedId,
      required int pageNum}) async {
    if (pageNum == 0) {
      emit(SpecificImagesLoading(items, isLoading: true));
    } else {
      emit(SpecificImagesPaginationLoading(items, isLoading: false));
    }
    var result = await _getBreedImagesUsecase
        .execute(GetBreedImagesUseCaseInput(uid, breedId!, pageNum));
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      if (pageNum == 0) {
        emit(SpecificImagesFailure(items, errMessage, isLoading: false));
      } else {
        emit(SpecificImagesPaginationFailure(items, errMessage,
            isLoading: false));
      }
    }, (catBreedSuccess) async {
      if (pageNum == 0) {
        if (catBreedSuccess.isEmpty) {
          emit(SpecificImagesSuccessFirstPageEmpty(items, isLoading: false));
        } else {
          items.clear();
          items.addAll(catBreedSuccess);
          emit(SpecificImagesSuccess(items, isLoading: false));
        }
      } else {
        if (catBreedSuccess.isEmpty) {
          var errMessage = S.current.no_more_cat_images;
          emit(SpecificImagesPaginationFailure(items, errMessage,
              isLoading: false));
        } else {
          items.addAll(catBreedSuccess);
          emit(SpecificImagesPaginationSuccess(items, isLoading: false));
        }
      }
    });
  }
}
