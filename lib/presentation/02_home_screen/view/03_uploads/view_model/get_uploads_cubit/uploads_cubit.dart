import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/get_uploads_usecase.dart';
import '../../../../../../generated/l10n.dart';

part 'uploads_state.dart';

class UploadsCubit extends Cubit<UploadsState> {
  final GetUploadsUsecase _getUploadsUsecase;
  List<CatWithClickEntity> _items = [];
  UploadsCubit(this._getUploadsUsecase)
      : super(const UploadsInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    _items = generateDummyCatImagesList();
  }
  Future<void> getUploads(
      {required String uid,
      required int pageNum,
      required bool isFirstCall}) async {
    if (pageNum == 0) {
      emit(UploadsLoading(_items, isLoading: isFirstCall));
    } else {
      emit(UploadsPaginationLoading(_items, isLoading: false));
    }

    var result =
        await _getUploadsUsecase.execute(UploadsUseCaseInput(uid, pageNum));

    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      if (pageNum == 0) {
        emit(UploadsFailure(_items, errMessage, isLoading: false));
      } else {
        emit(UploadsPaginationFailure(_items, errMessage, isLoading: false));
      }
    }, (catImagesSuccess) {
      if (pageNum == 0) {
        if (catImagesSuccess.isEmpty) {
          emit(UploadsSuccessFirstPageEmpty(_items, isLoading: false));
        } else {
          _items.clear();
          _items.addAll(catImagesSuccess);
          emit(UploadsSuccess(_items, isLoading: false));
        }
      } else {
        if (catImagesSuccess.isEmpty) {
          var errMessage = S.current.no_more_cat_images;
          emit(UploadsPaginationFailure(_items, errMessage, isLoading: false));
        } else {
          _items.addAll(catImagesSuccess);
          emit(UploadsPaginationSuccess(_items, isLoading: false));
        }
      }
    });
  }
}
