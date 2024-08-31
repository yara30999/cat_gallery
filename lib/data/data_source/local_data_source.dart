import 'package:hive/hive.dart';
import '../../domain/entities/authentication.dart';
import '../../domain/entities/cat_breed_card.dart';
import '../../presentation/resources/conistants_manager.dart';

abstract class LocalDataSource {
  List<CatBreedCardEntity> fetchCatBreeds();
  Future<void> saveCatBreedsToCache(List<CatBreedCardEntity> breeds);
  AuthenticationEntity fetchUserData();
  Future<void> saveUserDataToCache(AuthenticationEntity authEntity);
  Future<void> clearAllCachedBoxes();
  Future<void> clearBreedsCache();
  // void removeFromCache(String boxName);
}

class LocalDataSourceImpl implements LocalDataSource {
  var catBreedsBox = Hive.box<CatBreedCardEntity>(AppConstants.kBreedsBox);
  var userBox = Hive.box<AuthenticationEntity>(AppConstants.kUserDataBox);

  @override
  List<CatBreedCardEntity> fetchCatBreeds() {
    return catBreedsBox.values.toList();
  }

  @override
  Future<void> saveCatBreedsToCache(List<CatBreedCardEntity> breeds) async {
    await catBreedsBox.addAll(breeds);
  }

  @override
  AuthenticationEntity fetchUserData() {
    //because we only have one use for the entire app
    //so we want to return the first item in the iterable
    AuthenticationEntity userData;
    try {
      userData = userBox.values.first;
    } catch (e) {
      userData = const AuthenticationEntity(
          uid: '1111',
          name: 'dummy',
          email: 'dummy',
          countryMobileCode: 'dummy',
          phoneNum: 'dummy',
          gender: 'dummy');
    }
    return userData;
  }

  @override
  Future<void> saveUserDataToCache(AuthenticationEntity authEntity) async {
    await userBox.add(authEntity);
  }

  @override
  Future<void> clearAllCachedBoxes() async {
    await catBreedsBox.clear();
    await userBox.clear();
  }

  @override
  Future<void> clearBreedsCache() async {
    await catBreedsBox.clear();
  }
}
