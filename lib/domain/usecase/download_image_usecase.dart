import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class DownloadImageUsecase implements BaseUseCase<CatWithClickEntity, bool> {
  final Repository _repository;

  DownloadImageUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> execute([CatWithClickEntity? input]) {
    return _repository.downloadImage(input!);
  }
}
