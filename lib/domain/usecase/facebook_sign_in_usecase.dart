import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../entities/authentication.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class FacebookSignInUseCase implements BaseUseCase<void, AuthenticationEntity> {
  final Repository _repository;

  FacebookSignInUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationEntity>> execute([void input]) async {
    return await _repository.facebookSignIn();
  }
}
