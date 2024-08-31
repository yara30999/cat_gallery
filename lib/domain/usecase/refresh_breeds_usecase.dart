import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../entities/cat_breed_card.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RefreshBreedsUsecase
    implements BaseUseCase<String, List<CatBreedCardEntity>> {
  final Repository _repository;

  RefreshBreedsUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatBreedCardEntity>>> execute([String? input]) {
    return _repository.refreshBreedsWithImages(input!);
  }
}
