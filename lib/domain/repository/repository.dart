import 'package:dartz/dartz.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../../data/request_body/favourite_body.dart';
import '../../data/request_body/vote_body.dart';
import '../entities/authentication.dart';
import '../entities/cat_breed_card.dart';
import '../entities/cat_breed_entity.dart';
import '../entities/cat_image_entity.dart';
import '../entities/cat_with_click_entity.dart';
import '../entities/image_analysis_entity.dart';

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
  Future<Either<Failure, List<CatWithClickEntity>>> getNoCategoryImages(
      NoCategoryImagesRequest noCategoryImagesRequest);
  Future<Either<Failure, List<CatWithClickEntity>>> getCategoryImages(
      CategoryImagesRequest categoryImagesRequest);
  Future<Either<Failure, List<CatWithClickEntity>>> getVotes(
      UidPageNumRequest uidPageNumRequest);
  Future<Either<Failure, Vote>> postVote(VoteBody voteBody);
  Future<Either<Failure, List<CatWithClickEntity>>> getFavourites(
      UidPageNumRequest uidPageNumRequest);
  Future<Either<Failure, Favourite>> postFavourite(FavouriteBody favouriteBody);
  Future<Either<Failure, bool>> deleteFavourite(
      DeleteFavouriteRequest deleteFavouriteRequest);
  Future<Either<Failure, List<CatWithClickEntity>>> getUploads(
      UidPageNumRequest uidPageNumRequest);
  Future<Either<Failure, void>> deleteUploadedImage(
      DeleteImageRequest deleteImageRequest);
  Future<Either<Failure, void>> uploadedImage(
      UploadImageRequest uploadImageRequest);
  Future<Either<Failure, ImageAnalysisEntity>> getImageAnalysis(
      GetImageAnalysisRequest getImageAnalysisRequest);
  Future<Either<Failure, bool>> downloadImage(
      CatWithClickEntity catWithClickEntity);
  Future<Either<Failure, ShareResult>> share(
      CatWithClickEntity catWithClickEntity);
}
