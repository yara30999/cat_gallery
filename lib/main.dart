import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initAppModule();
  runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
