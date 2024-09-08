import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetUploadsUsecase
    implements BaseUseCase<UploadsUseCaseInput, List<CatWithClickEntity>> {
  final Repository _repository;

  GetUploadsUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> execute(
      [UploadsUseCaseInput? input]) {
    return _repository.getUploads(UidPageNumRequest(input!.uid, input.pageNum));
  }
}

class UploadsUseCaseInput {
  String uid;
  int pageNum;

  UploadsUseCaseInput(this.uid, this.pageNum);
}
