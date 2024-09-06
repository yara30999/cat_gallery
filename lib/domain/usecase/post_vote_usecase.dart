import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/request_body/vote_body.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class PostVoteUsecase implements BaseUseCase<VoteBody, Vote> {
  final Repository _repository;

  PostVoteUsecase(this._repository);

  @override
  Future<Either<Failure, Vote>> execute([VoteBody? input]) {
    return _repository.postVote(input!);
  }
}
