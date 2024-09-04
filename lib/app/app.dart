import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';
import '../presentation/01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../presentation/02_home/view_model/settings_cubit/settings_cubit.dart';
import '../presentation/04_no_breed/view/widgets/my_custom_scroll_behavior.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/size_config.dart';
import '../presentation/resources/theme_manager.dart';
import 'di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // to initialize h && w inside the class
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthCubit(instance(), instance(),
              instance(), instance(), instance(), instance()),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.onBoardingRoute,
            themeMode: BlocProvider.of<SettingsCubit>(context).currentTheme,
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            locale: BlocProvider.of<SettingsCubit>(context).currentLocale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
