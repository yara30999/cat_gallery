import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_breed_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetBreedInfoUsecase
    implements BaseUseCase<GetBreedInfoUseCaseInput, CatBreedEntity> {
  final Repository _repository;

  GetBreedInfoUsecase(this._repository);

  @override
  Future<Either<Failure, CatBreedEntity>> execute(
      [GetBreedInfoUseCaseInput? input]) {
    return _repository
        .getBreedInfo(BreedInfoRequest(input!.uid, input.breedId));
  }
}

class GetBreedInfoUseCaseInput {
  String uid;
  String breedId;

  GetBreedInfoUseCaseInput(this.uid, this.breedId);
}
