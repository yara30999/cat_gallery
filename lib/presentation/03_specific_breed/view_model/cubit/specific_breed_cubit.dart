import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../../domain/usecase/get_breed_info_usecase.dart';

part 'specific_breed_state.dart';

class SpecificBreedCubit extends Cubit<SpecificBreedState> {
  final GetBreedInfoUsecase _getBreedInfoUsecase;
  SpecificBreedCubit(this._getBreedInfoUsecase) : super(SpecificBreedInitial());
  String? breedId;
  String? breedName;
  CatBreedEntity? catBreedInfo;

  Future<void> getBreedInfo(
      {required String uid, required String breedId}) async {
    emit(SpecificBreedLoading());
    var result = await _getBreedInfoUsecase
        .execute(GetBreedInfoUseCaseInput(uid, breedId));
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(SpecificBreedFailure(errMessage: errMessage));
    }, (catBreedSuccess) async {
      catBreedInfo = catBreedSuccess;
      emit(SpecificBreedSuccess(catBreedEntity: catBreedSuccess));
    });
  }
}
