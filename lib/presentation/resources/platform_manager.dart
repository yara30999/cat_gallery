import 'package:flutter/foundation.dart';

bool isWebOrDesktopApp() {
  if (kIsWeb) {
    return true;
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return false;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return true;
      default:
        return false;
    }
  }
}
