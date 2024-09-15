import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/usecase/upload_image_usecase.dart';
import '../../../../generated/l10n.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageUsecase _uploadImageUsecase;
  File? imgFile;
  String? uid;
  String? breedId;
  int? categoryId;
  UploadImageCubit(this._uploadImageUsecase) : super(UploadImageInitial());

  Future<void> upload() async {
    emit(UploadImageLoading());
    if (imgFile == null) {
      var errMessage = S.current.no_image_to_upload;
      emit(UploadImageEmpty(errMessage: errMessage));
    } else {
      var result = await _uploadImageUsecase.execute(
          UploadImageUseCaseInput(imgFile!, uid!, breedId, categoryId));
      result.fold((failure) async {
        var errMessage =
            '${failure.message.toString()} ${failure.code.toString()}';
        emit(UploadImageFailure(errMessage: errMessage));
      }, (noData) async {
        emit(UploadImageSuccess());
      });
    }
  }
}
