import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/authentication.dart';
import '../entities/cat_breed_card.dart';
import '../entities/cat_breed_entity.dart';
import '../entities/cat_image_entity.dart';
import '../entities/cat_with_click_entity.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationEntity>> login(
      LoginRequest loginRequest);
  Future<Either<Failure, bool>> forgotPassword(String email);
  Future<Either<Failure, AuthenticationEntity>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, AuthenticationEntity>> googleSignIn();
  Future<Either<Failure, AuthenticationEntity>> facebookSignIn();
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, List<CatBreedCardEntity>>> getBreedsWithImages(
      String uid);
  Future<Either<Failure, List<CatBreedCardEntity>>> refreshBreedsWithImages(
      String uid);
  Future<Either<Failure, CatImageEntity>> getCatImage(
      CatImageRequest catImageRequest);
  Future<Either<Failure, CatBreedEntity>> getBreedInfo(
      BreedInfoRequest breedInfoRequest);
  Future<Either<Failure, List<CatWithClickEntity>>> getBreedImages(
      BreedImagesRequest breedImagesRequest);
}
