import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';
import '../../app/app_prefs.dart';
import '../../domain/entities/authentication.dart';
import '../../domain/entities/cat_breed_card.dart';
import '../../domain/entities/cat_breed_entity.dart';
import '../../domain/entities/cat_image_entity.dart';
import '../../domain/entities/cat_with_click_entity.dart';
import '../../domain/entities/image_analysis_entity.dart';
import '../../domain/repository/repository.dart';
import '../../presentation/resources/language_manager.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../mappers/mappers.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';
import '../request_body/favourite_body.dart';
import '../request_body/vote_body.dart';
import '../responses/breeds_response.dart';
import '../responses/cat_with_click_response.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;
  final GoogleTranslator _googleTranslator;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,
      this._localDataSource, this._appPreferences, this._googleTranslator);

  @override
  Future<Either<Failure, AuthenticationEntity>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.login(loginRequest);
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.register(registerRequest);
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> googleSignIn() async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.googleSignIn();
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> facebookSignIn() async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.facebookSignIn();
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.logout();
        await _localDataSource.clearAllCachedBoxes();
        await _appPreferences.removePrefs();
        return const Right(true);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.forgotPassword(email);
        return const Right(true);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatBreedCardEntity>>> getBreedsWithImages(
      String uid) async {
    //get entity from cache
    final catBreedCardEntities = _localDataSource.fetchCatBreeds();
    if (catBreedCardEntities.isNotEmpty) {
      return Right(catBreedCardEntities);
    }
    //if the cashe is empty, call the api.
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getBreeds(uid);
        var language = await _appPreferences.getAppLanguage();
        List<CatBreedCardEntity> myEntity = [];
        for (var res in response) {
          if (language != LanguageType.english.getCode()) {
            var nameTranslation = await _googleTranslator.translate(res.name,
                from: 'en', to: language);
            res = res.copyWith(name: nameTranslation.text);
          }
          myEntity.add(res.toDomain());
        }
        //save to cache for first time
        _localDataSource.saveCatBreedsToCache(myEntity);
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatBreedCardEntity>>> refreshBreedsWithImages(
      String uid) async {
    //clear only the breeds cache
    await _localDataSource.clearBreedsCache();
    //then call the api again.
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getBreeds(uid);
        var language = await _appPreferences.getAppLanguage();
        List<CatBreedCardEntity> myEntity = [];
        for (var res in response) {
          if (language != LanguageType.english.getCode()) {
            var nameTranslation = await _googleTranslator.translate(res.name,
                from: 'en', to: language);
            res = res.copyWith(name: nameTranslation.text);
          }
          myEntity.add(res.toDomain());
        }
        //save the refreshed data to the cache
        _localDataSource.saveCatBreedsToCache(myEntity);
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, CatImageEntity>> getCatImage(
      CatImageRequest catImageRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getCatImage(catImageRequest);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, CatBreedEntity>> getBreedInfo(
      BreedInfoRequest breedInfoRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _remoteDataSource.getBreedInfo(breedInfoRequest);
        var language = await _appPreferences.getAppLanguage();
        if (language != LanguageType.english.getCode()) {
          var nameTranslation = await _googleTranslator.translate(response.name,
              from: 'en', to: language);
          var temperamentTranslation = await _googleTranslator
              .translate(response.temperament, from: 'en', to: language);
          var originTranslation = await _googleTranslator
              .translate(response.origin, from: 'en', to: language);
          var descriptionTranslation = await _googleTranslator
              .translate(response.description, from: 'en', to: language);
          response = response.copyWith(
              name: nameTranslation.text,
              temperament: temperamentTranslation.text,
              origin: originTranslation.text,
              description: descriptionTranslation.text);
        }
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> getBreedImages(
      BreedImagesRequest breedImagesRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getBreedImages(breedImagesRequest);
        List<CatWithClickEntity> myEntity = [];
        for (var res in response) {
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> getNoCategoryImages(
      NoCategoryImagesRequest noCategoryImagesRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .getNoCategoryImages(noCategoryImagesRequest);
        List<CatWithClickEntity> myEntity = [];
        for (var res in response) {
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> getCategoryImages(
      CategoryImagesRequest categoryImagesRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getCategoryImages(categoryImagesRequest);
        List<CatWithClickEntity> myEntity = [];
        for (var res in response) {
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> getVotes(
      UidPageNumRequest uidPageNumRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getVotes(uidPageNumRequest);
        List<CatWithClickEntity> myEntity = [];
        for (var res in response) {
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Vote>> postVote(VoteBody voteBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.postVote(voteBody);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> getFavourites(
      UidPageNumRequest uidPageNumRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getFavourites(uidPageNumRequest);
        List<CatWithClickEntity> myEntity = [];
        for (var res in response) {
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Favourite>> postFavourite(
      FavouriteBody favouriteBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.postFavourite(favouriteBody);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavourite(
      DeleteFavouriteRequest deleteFavouriteRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.deleteFavourite(deleteFavouriteRequest);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> getUploads(
      UidPageNumRequest uidPageNumRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getUploads(uidPageNumRequest);
        var language = await _appPreferences.getAppLanguage();
        List<CatWithClickEntity> myEntity = [];
        for (var res in response) {
          if (language != LanguageType.english.getCode()) {
            if (res.breeds.isNotEmpty) {
              var nameTranslation = await _googleTranslator
                  .translate(res.breeds.first.name, from: 'en', to: language);
              List<BreedResponse> modifiedBreeds = res.breeds.map((breed) {
                return breed.copyWith(name: nameTranslation.text);
              }).toList();
              res = res.copyWith(breeds: modifiedBreeds);
            }
            if (res.categories!.isNotEmpty) {
              var nameTranslation = await _googleTranslator.translate(
                  res.categories!.first.name,
                  from: 'en',
                  to: language);
              List<CategoryResponse>? modifiedCategories =
                  res.categories!.map((category) {
                return category.copyWith(name: nameTranslation.text);
              }).toList();
              res = res.copyWith(categories: modifiedCategories);
            }
          }
          myEntity.add(res.toDomain());
        }
        return Right(myEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteUploadedImage(
      DeleteImageRequest deleteImageRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.deleteUploadedImage(deleteImageRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> uploadedImage(
      UploadImageRequest uploadImageRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.uploadImage(uploadImageRequest);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ImageAnalysisEntity>> getImageAnalysis(
      GetImageAnalysisRequest getImageAnalysisRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getImageAnalysis(getImageAnalysisRequest);
        ImageAnalysisEntity res = response[0].toDomain();
        var language = await _appPreferences.getAppLanguage();
        if (language != LanguageType.english.getCode()) {
          List<Label> updatedLabels = [];
          for (var i = 0; i < res.labels.length; i++) {
            var labelTranslation = await _googleTranslator
                .translate(res.labels[i].name, from: 'en', to: language);
            updatedLabels
                .add(res.labels[i].copyWith(name: labelTranslation.text));
          }
          res = res.copyWith(labels: updatedLabels);
        }
        return Right(res);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> downloadImage(
      CatWithClickEntity catWithClickEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        if (kIsWeb) {
          await _remoteDataSource.downloadImageWeb(catWithClickEntity);
        } else {
          await _remoteDataSource.downloadImageAndroidIOS(catWithClickEntity);
        }
        return const Right(true);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ShareResult>> share(
      CatWithClickEntity catWithClickEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        var result = await _remoteDataSource.shareImage(catWithClickEntity);
        return Right(result);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
