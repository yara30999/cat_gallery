import 'package:get_it/get_it.dart';
import '../data/special_sevices/country_service.dart';
import '../data/special_sevices/validation_service.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies
  // validation service instance for all text form fields in the app
  instance
      .registerLazySingleton<IValidationService>(() => ValidationServiceImpl());
  instance.registerLazySingleton<ICountryDataService>(
      () => CountryDataServiceImpl());
}
