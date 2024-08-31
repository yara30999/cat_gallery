import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'domain/entities/authentication.dart';
import 'domain/entities/cat_breed_card.dart';
import 'firebase_options.dart';
import 'app/app.dart';
import 'app/di.dart';
import 'presentation/02_home/view_model/settings_cubit/settings_cubit.dart';
import 'presentation/resources/conistants_manager.dart';
import 'simple_opserver.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = SimpleObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(CatBreedCardEntityAdapter());
  Hive.registerAdapter(AuthenticationEntityAdapter());
  await Hive.openBox<CatBreedCardEntity>(AppConstants.kBreedsBox);
  await Hive.openBox<AuthenticationEntity>(AppConstants.kUserDataBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppModule();
  // check if is running on Web
  if (kIsWeb) {
    // initialize the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "1030545768602779",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode,
      builder: (context) => BlocProvider(
        create: (context) => SettingsCubit(instance())
          ..getLocale()
          ..getTheme(),
        child: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is ThemeSuccess) {
              Future.delayed(const Duration(seconds: AppConstants.splashDelay))
                  .then((value) => {FlutterNativeSplash.remove()});
            }
          },
          child: const MyApp(),
        ),
      ),
    ),
  );
}
