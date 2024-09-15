import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';
import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../data/special_sevices/country_service.dart';
import '../data/special_sevices/validation_service.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/delete_favourite_usecase.dart';
import '../domain/usecase/delete_uploaded_image_usecase.dart';
import '../domain/usecase/download_image_usecase.dart';
import '../domain/usecase/facebook_sign_in_usecase.dart';
import '../domain/usecase/forgot_password_usecase.dart';
import '../domain/usecase/get_breed_images_usecase.dart';
import '../domain/usecase/get_breed_info_usecase.dart';
import '../domain/usecase/get_breeds_usecase.dart';
import '../domain/usecase/get_cat_image_usecase.dart';
import '../domain/usecase/get_category_images_usecase.dart';
import '../domain/usecase/get_favourites_usecase.dart';
import '../domain/usecase/get_image_analysis_usecase.dart';
import '../domain/usecase/get_no_category_images_usecase.dart';
import '../domain/usecase/get_uploads_usecase.dart';
import '../domain/usecase/get_votes_usecase.dart';
import '../domain/usecase/google_sign_in_usecase.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/logout_usecase.dart';
import '../domain/usecase/post_favourite_usecase.dart';
import '../domain/usecase/post_vote_usecase.dart';
import '../domain/usecase/refresh_breeds_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../domain/usecase/share_image_usecase.dart';
import '../domain/usecase/upload_image_usecase.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies
  // validation service instance for all text form fields in the app
  instance
      .registerLazySingleton<IValidationService>(() => ValidationServiceImpl());
  instance.registerLazySingleton<ICountryDataService>(
      () => CountryDataServiceImpl());
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferencesImpl(instance()));
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  // remote data source
  final firebaseInstance = FirebaseAuth.instance;
  instance.registerLazySingleton<FirebaseAuth>(() => firebaseInstance);
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
      instance<AppServiceClient>(), instance<FirebaseAuth>()));
  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  // repository
  final googleTranslator = GoogleTranslator();
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
      instance(), instance(), instance(), instance(), googleTranslator));
  // login usecase
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  }
  // register usecase
  if (!GetIt.I.isRegistered<RegisterUsecase>()) {
    instance
        .registerFactory<RegisterUsecase>(() => RegisterUsecase(instance()));
  }
// logout usecase
  if (!GetIt.I.isRegistered<LogoutUsecase>()) {
    instance.registerFactory<LogoutUsecase>(() => LogoutUsecase(instance()));
  }

  // google sign in usecase
  if (!GetIt.I.isRegistered<GoogleSignInUseCase>()) {
    instance.registerFactory<GoogleSignInUseCase>(
        () => GoogleSignInUseCase(instance()));
  }
  // facebook sign in usecase
  if (!GetIt.I.isRegistered<FacebookSignInUseCase>()) {
    instance.registerFactory<FacebookSignInUseCase>(
        () => FacebookSignInUseCase(instance()));
  }
  // forgot password usecase
  if (!GetIt.I.isRegistered<ForgotPasswordUsecase>()) {
    instance.registerFactory<ForgotPasswordUsecase>(
        () => ForgotPasswordUsecase(instance()));
  }
  // get breeds usecase
  if (!GetIt.I.isRegistered<GetBreedsUsecase>()) {
    instance
        .registerFactory<GetBreedsUsecase>(() => GetBreedsUsecase(instance()));
  }
  // get cat image usecase
  if (!GetIt.I.isRegistered<GetCatImageUsecase>()) {
    instance.registerFactory<GetCatImageUsecase>(
        () => GetCatImageUsecase(instance()));
  }
  // refresh cat breeds usecase
  if (!GetIt.I.isRegistered<RefreshBreedsUsecase>()) {
    instance.registerFactory<RefreshBreedsUsecase>(
        () => RefreshBreedsUsecase(instance()));
  }
  // get breed info usecase
  if (!GetIt.I.isRegistered<GetBreedInfoUsecase>()) {
    instance.registerFactory<GetBreedInfoUsecase>(
        () => GetBreedInfoUsecase(instance()));
  }
  // get breed images usecase
  if (!GetIt.I.isRegistered<GetBreedImagesUsecase>()) {
    instance.registerFactory<GetBreedImagesUsecase>(
        () => GetBreedImagesUsecase(instance()));
  }
  // get no category images usecase
  if (!GetIt.I.isRegistered<GetNoCategoryImagesUsecase>()) {
    instance.registerFactory<GetNoCategoryImagesUsecase>(
        () => GetNoCategoryImagesUsecase(instance()));
  }
  // get categroy images usecase
  if (!GetIt.I.isRegistered<GetCategoryImagesUsecase>()) {
    instance.registerFactory<GetCategoryImagesUsecase>(
        () => GetCategoryImagesUsecase(instance()));
  }
  // get votes usecase
  if (!GetIt.I.isRegistered<GetVotesUsecase>()) {
    instance
        .registerFactory<GetVotesUsecase>(() => GetVotesUsecase(instance()));
  }
  // post vote usecase
  if (!GetIt.I.isRegistered<PostVoteUsecase>()) {
    instance
        .registerFactory<PostVoteUsecase>(() => PostVoteUsecase(instance()));
  }
  // get favourites usecase
  if (!GetIt.I.isRegistered<GetFavouritesUsecase>()) {
    instance.registerFactory<GetFavouritesUsecase>(
        () => GetFavouritesUsecase(instance()));
  }
  // post favourite usecase
  if (!GetIt.I.isRegistered<PostFavouriteUsecase>()) {
    instance.registerFactory<PostFavouriteUsecase>(
        () => PostFavouriteUsecase(instance()));
  }
  // delete favourite usecase
  if (!GetIt.I.isRegistered<DeleteFavouriteUsecase>()) {
    instance.registerFactory<DeleteFavouriteUsecase>(
        () => DeleteFavouriteUsecase(instance()));
  }
  // get uploads usecase
  if (!GetIt.I.isRegistered<GetUploadsUsecase>()) {
    instance.registerFactory<GetUploadsUsecase>(
        () => GetUploadsUsecase(instance()));
  }
  // delete uploaded image usecase
  if (!GetIt.I.isRegistered<DeleteUploadedImageUsecase>()) {
    instance.registerFactory<DeleteUploadedImageUsecase>(
        () => DeleteUploadedImageUsecase(instance()));
  }
  //upload image usecase
  if (!GetIt.I.isRegistered<UploadImageUsecase>()) {
    instance.registerFactory<UploadImageUsecase>(
        () => UploadImageUsecase(instance()));
  }
  //get image analysis usecase
  if (!GetIt.I.isRegistered<GetImageAnalysisUsecase>()) {
    instance.registerFactory<GetImageAnalysisUsecase>(
        () => GetImageAnalysisUsecase(instance()));
  }
  //download image usecase
  if (!GetIt.I.isRegistered<DownloadImageUsecase>()) {
    instance.registerFactory<DownloadImageUsecase>(
        () => DownloadImageUsecase(instance()));
  }
  //download image usecase
  if (!GetIt.I.isRegistered<ShareImageUsecase>()) {
    instance.registerFactory<ShareImageUsecase>(
        () => ShareImageUsecase(instance()));
  }
}
