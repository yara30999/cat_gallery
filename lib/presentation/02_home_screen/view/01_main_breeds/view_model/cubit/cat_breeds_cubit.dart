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
  late List<CatBreedCardEntity> _catBreedsList;
  List<CatBreedCardEntity> get catBreedsList => _catBreedsList;
  // This will store the filtered list
  List<CatBreedCardEntity> _filteredBreedsList = [];

  CatBreedsCubit(this._getBreedsUsecase, this._refreshBreedsUsecase)
      : super(const CatBreedsInitial([], loading: false)) {
    // Initialize _catBreedsList in the constructor body
    _catBreedsList = generateDummyCatBreedsList();
  }

  void searchBreeds(String query) {
    if (query.isEmpty) {
      // Reset to full list if query is empty
      _filteredBreedsList = _catBreedsList;
    } else {
      _filteredBreedsList = _catBreedsList
          .where((breed) =>
              breed.breedName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(CatBreedsSuccess(_filteredBreedsList, loading: false));
  }

  Future<void> getBreeds({required String uid}) async {
    emit(CatBreedsLoading(_catBreedsList, loading: true));
    var result = await _getBreedsUsecase.execute(uid);
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(CatBreedsFailure(_catBreedsList,
          errMessage: errMessage, loading: false));
    }, (catBreedsSuccess) async {
      _catBreedsList = catBreedsSuccess;
      emit(CatBreedsSuccess(catBreedsSuccess, loading: false));
    });
  }

  Future<void> refreshBreeds({required String uid}) async {
    emit(CatBreedsLoading(_catBreedsList, loading: true));
    var result = await _refreshBreedsUsecase.execute(uid);
    result.fold((failure) {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(CatBreedsFailure(_catBreedsList,
          errMessage: errMessage, loading: false));
    }, (catBreedsSuccess) async {
      _catBreedsList = catBreedsSuccess;
      emit(CatBreedsSuccess(catBreedsSuccess, loading: false));
    });
  }
}
