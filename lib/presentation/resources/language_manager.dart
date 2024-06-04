import 'dart:ui';
import 'package:intl/intl.dart';

enum LanguageType { english, arabic }

/*
Do not forget to use shared prefs on the localization 
*/

const String arabic = "ar";
const String english = "en";

const Locale arabicLocal = Locale("ar", "SA");
const Locale englishLocal = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}

bool currentLocalIsAr() {
  return Intl.getCurrentLocale() == LanguageType.arabic.getValue();
}

bool currentLocalIsEn() {
  return Intl.getCurrentLocale() == LanguageType.english.getValue();
}
