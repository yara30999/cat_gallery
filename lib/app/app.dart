import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';
import '../presentation/01_login-register/view_model/cubit/auth_cubit.dart';
import '../presentation/04_random_breed/view/widgets/my_custom_scroll_behavior.dart';
import '../presentation/resources/language_manager.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/size_config.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // to initialize h && w inside the class
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.loginRoute,
        themeMode: ThemeMode.light,
        theme: getLightTheme(),
        darkTheme: getDarkTheme(),
        locale: LocalizationUtils.englishLocal,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
