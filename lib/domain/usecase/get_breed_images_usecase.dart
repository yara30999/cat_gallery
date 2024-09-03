import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetBreedImagesUsecase
    implements
        BaseUseCase<GetBreedImagesUseCaseInput, List<CatWithClickEntity>> {
  final Repository _repository;

  GetBreedImagesUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> execute(
      [GetBreedImagesUseCaseInput? input]) {
    return _repository.getBreedImages(
        BreedImagesRequest(input!.uid, input.breedId, input.pageNum));
  }
}

class GetBreedImagesUseCaseInput {
  String uid;
  String breedId;
  int pageNum;

  GetBreedImagesUseCaseInput(this.uid, this.breedId, this.pageNum);
}
