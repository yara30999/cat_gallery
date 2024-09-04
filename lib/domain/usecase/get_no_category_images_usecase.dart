import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetNoCategoryImagesUsecase
    implements
        BaseUseCase<NoCategoryImagesUseCaseInput, List<CatWithClickEntity>> {
  final Repository _repository;

  GetNoCategoryImagesUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> execute(
      [NoCategoryImagesUseCaseInput? input]) {
    return _repository.getNoCategoryImages(
        NoCategoryImagesRequest(input!.uid, input.pageNum, input.order));
  }
}

class NoCategoryImagesUseCaseInput {
  String uid;
  int pageNum;
  String order;

  NoCategoryImagesUseCaseInput(this.uid, this.pageNum, this.order);
}
