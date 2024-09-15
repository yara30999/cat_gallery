import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/cat_breed_card.dart';
import '../../../../../../domain/usecase/get_breeds_usecase.dart';
import '../../../../../../domain/usecase/refresh_breeds_usecase.dart';
part 'cat_breeds_state.dart';

class CatBreedsCubit extends Cubit<CatBreedsState> {
  final GetBreedsUsecase _getBreedsUsecase;
  final RefreshBreedsUsecase _refreshBreedsUsecase;
  late List<CatBreedCardEntity> catBreedsList;
  // This will store the filtered list
  List<CatBreedCardEntity> filteredBreedsList = [];

  CatBreedsCubit(this._getBreedsUsecase, this._refreshBreedsUsecase)
      : super(const CatBreedsInitial([], loading: false)) {
    // Initialize catBreedsList in the constructor body
    catBreedsList = generateDummyCatBreedsList();
  }

  void searchBreeds(String query) {
    if (query.isEmpty) {
      // Reset to full list if query is empty
      filteredBreedsList = catBreedsList;
    } else {
      filteredBreedsList = catBreedsList
          .where((breed) =>
              breed.breedName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(CatBreedsSuccess(filteredBreedsList, loading: false));
  }

  Future<void> getBreeds({required String uid}) async {
    emit(CatBreedsLoading(catBreedsList, loading: true));
    var result = await _getBreedsUsecase.execute(uid);
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(CatBreedsFailure(catBreedsList,
          errMessage: errMessage, loading: false));
    }, (catBreedsSuccess) async {
      catBreedsList = catBreedsSuccess;
      emit(CatBreedsSuccess(catBreedsSuccess, loading: false));
    });
  }

  Future<void> refreshBreeds({required String uid}) async {
    emit(CatBreedsLoading(catBreedsList, loading: true));
    var result = await _refreshBreedsUsecase.execute(uid);
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(CatBreedsFailure(catBreedsList,
          errMessage: errMessage, loading: false));
    }, (catBreedsSuccess) async {
      catBreedsList = catBreedsSuccess;
      emit(CatBreedsSuccess(catBreedsSuccess, loading: false));
    });
  }
}
