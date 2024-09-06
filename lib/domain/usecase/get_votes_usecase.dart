import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetVotesUsecase
    implements BaseUseCase<VotesUseCaseInput, List<CatWithClickEntity>> {
  final Repository _repository;

  GetVotesUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> execute(
      [VotesUseCaseInput? input]) {
    return _repository.getVotes(UidPageNumRequest(input!.uid, input.pageNum));
  }
}

class VotesUseCaseInput {
  String uid;
  int pageNum;

  VotesUseCaseInput(this.uid, this.pageNum);
}
