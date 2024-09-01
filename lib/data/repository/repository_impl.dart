import 'package:dartz/dartz.dart';
import '../../app/app_prefs.dart';
import '../../domain/entities/authentication.dart';
import '../../domain/entities/cat_breed_card.dart';
import '../../domain/entities/cat_breed_entity.dart';
import '../../domain/entities/cat_image_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../mappers/mappers.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,
      this._localDataSource, this._appPreferences);

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
        List<CatBreedCardEntity> myEntity = [];
        for (var res in response) {
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
        List<CatBreedCardEntity> myEntity = [];
        for (var res in response) {
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
        final response = await _remoteDataSource.getBreedInfo(breedInfoRequest);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
