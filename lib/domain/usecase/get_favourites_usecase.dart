import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetFavouritesUsecase
    implements BaseUseCase<FavouritesUseCaseInput, List<CatWithClickEntity>> {
  final Repository _repository;

  GetFavouritesUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> execute(
      [FavouritesUseCaseInput? input]) {
    return _repository
        .getFavourites(UidPageNumRequest(input!.uid, input.pageNum));
  }
}

class FavouritesUseCaseInput {
  String uid;
  int pageNum;

  FavouritesUseCaseInput(this.uid, this.pageNum);
}
