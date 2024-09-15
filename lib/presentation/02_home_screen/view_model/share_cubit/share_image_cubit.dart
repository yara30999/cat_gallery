import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../domain/usecase/share_image_usecase.dart';

part 'share_image_state.dart';

class ShareImageCubit extends Cubit<ShareImageState> {
  final ShareImageUsecase _shareImageUsecase;
  ShareImageCubit(this._shareImageUsecase) : super(ShareImageInitial());

  Future<void> share({required CatWithClickEntity catWithClickEntity}) async {
    emit(ShareImageLoading());
    var result = await _shareImageUsecase.execute(catWithClickEntity);
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(ShareImageFailure(errMessage: errMessage));
    }, (boolResult) async {
      emit(ShareImageSuccess());
    });
  }
}
