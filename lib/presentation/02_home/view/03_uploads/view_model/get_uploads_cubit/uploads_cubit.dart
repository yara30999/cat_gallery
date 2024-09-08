import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../../domain/usecase/get_uploads_usecase.dart';
import '../../../../../../generated/l10n.dart';

part 'uploads_state.dart';

class UploadsCubit extends Cubit<UploadsState> {
  final GetUploadsUsecase _getUploadsUsecase;
  List<CatWithClickEntity> items = [];
  UploadsCubit(this._getUploadsUsecase)
      : super(const UploadsInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    items = generateDummyCatImagesList();
  }
  Future<void> getUploads({required String uid, required int pageNum}) async {
    if (pageNum == 0) {
      emit(UploadsLoading(items, isLoading: true));
    } else {
      emit(UploadsPaginationLoading(items, isLoading: false));
    }

    var result =
        await _getUploadsUsecase.execute(UploadsUseCaseInput(uid, pageNum));

    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      if (pageNum == 0) {
        emit(UploadsFailure(items, errMessage, isLoading: false));
      } else {
        emit(UploadsPaginationFailure(items, errMessage, isLoading: false));
      }
    }, (catImagesSuccess) {
      if (pageNum == 0) {
        if (catImagesSuccess.isEmpty) {
          emit(UploadsSuccessFirstPageEmpty(items, isLoading: false));
        } else {
          items.clear();
          items.addAll(catImagesSuccess);
          emit(UploadsSuccess(items, isLoading: false));
        }
      } else {
        if (catImagesSuccess.isEmpty) {
          var errMessage = S.current.no_more_cat_images;
          emit(UploadsPaginationFailure(items, errMessage, isLoading: false));
        } else {
          items.addAll(catImagesSuccess);
          emit(UploadsPaginationSuccess(items, isLoading: false));
        }
      }
    });
  }
}
