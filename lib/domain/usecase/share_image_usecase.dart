import 'package:dartz/dartz.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/network/failure.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ShareImageUsecase
    implements BaseUseCase<CatWithClickEntity, ShareResult> {
  final Repository _repository;

  ShareImageUsecase(this._repository);

  @override
  Future<Either<Failure, ShareResult>> execute([CatWithClickEntity? input]) {
    return _repository.share(input!);
  }
}
