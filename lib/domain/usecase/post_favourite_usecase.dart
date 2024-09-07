import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/request_body/favourite_body.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class PostFavouriteUsecase implements BaseUseCase<FavouriteBody, Favourite> {
  final Repository _repository;

  PostFavouriteUsecase(this._repository);

  @override
  Future<Either<Failure, Favourite>> execute([FavouriteBody? input]) {
    return _repository.postFavourite(input!);
  }
}
