import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class DeleteFavouriteUsecase
    implements BaseUseCase<DeleteFavouriteUseCaseInput, bool> {
  final Repository _repository;

  DeleteFavouriteUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> execute([DeleteFavouriteUseCaseInput? input]) {
    return _repository
        .deleteFavourite(DeleteFavouriteRequest(input!.uid, input.favId));
  }
}

class DeleteFavouriteUseCaseInput {
  String uid;
  String favId;

  DeleteFavouriteUseCaseInput(this.uid, this.favId);
}
