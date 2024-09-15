import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../domain/usecase/download_image_usecase.dart';

part 'download_image_state.dart';

class DownloadImageCubit extends Cubit<DownloadImageState> {
  final DownloadImageUsecase _downloadImageUsecase;
  DownloadImageCubit(this._downloadImageUsecase)
      : super(DownloadImageInitial());

  Future<void> download(
      {required CatWithClickEntity catWithClickEntity}) async {
    emit(DownloadImageLoading());
    var result = await _downloadImageUsecase.execute(catWithClickEntity);
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(DownloadImageFailure(errMessage: errMessage));
    }, (boolResult) async {
      emit(DownloadImageSuccess());
    });
  }
}
