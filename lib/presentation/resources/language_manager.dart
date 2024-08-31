import 'dart:ui';
import 'package:intl/intl.dart';

enum LanguageType { english, arabic }

const String arabic = "ar";
const String english = "en";

extension LanguageTypeExtension on LanguageType {
  String getCode() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}

class LocalizationUtils {
  static const Locale arabicLocal = Locale("ar", "SA");
  static const Locale englishLocal = Locale("en", "US");

  static bool currentLocalIsAr() {
    return Intl.getCurrentLocale() == LanguageType.arabic.getCode();
  }
}
