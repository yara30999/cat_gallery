import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../domain/usecase/delete_uploaded_image_usecase.dart';

part 'delete_image_state.dart';

class DeleteImageCubit extends Cubit<DeleteImageState> {
  final DeleteUploadedImageUsecase _deleteUploadedImageUsecase;
  DeleteImageCubit(this._deleteUploadedImageUsecase)
      : super(DeleteImageInitial());

  Future<void> deleteImg({required String uid, required String imgId}) async {
    emit(DeleteImageLoading());
    var result = await _deleteUploadedImageUsecase
        .execute(DeleteUploadedImageUseCaseInput(uid, imgId));
    result.fold((failure) async {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(DeleteImageFailure(errMessage: errMessage));
    }, (noData) async {
      emit(DeleteImageSuccess());
    });
  }
}
