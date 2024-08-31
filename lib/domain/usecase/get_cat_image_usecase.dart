import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_image_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetCatImageUsecase
    implements BaseUseCase<GetCatImageUseCaseInput, CatImageEntity> {
  final Repository _repository;

  GetCatImageUsecase(this._repository);

  @override
  Future<Either<Failure, CatImageEntity>> execute(
      [GetCatImageUseCaseInput? input]) {
    return _repository.getCatImage(CatImageRequest(input!.uid, input.imgid));
  }
}

class GetCatImageUseCaseInput {
  String uid;
  String imgid;

  GetCatImageUseCaseInput(this.uid, this.imgid);
}
