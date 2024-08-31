import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/resources/language_manager.dart';
import 'extensions.dart';

const String prefsKeyLanguage = "PREFS_KEY_LANG";
const String prefsKeyTheme = "PREFS_KEY_THEME";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

abstract class AppPreferences {
  Future<String> getAppLanguage();
  Future<void> setLocale(Locale locale);
  Future<Locale> getLocale();
  Future<String> getAppThemeName();
  Future<void> setTheme(ThemeMode theme);
  Future<ThemeMode> getTheme();
  Future<void> setUserLoggedIn();
  Future<bool> isUserLoggedIn();
  Future<void> removePrefs();
}

class AppPreferencesImpl implements AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferencesImpl(this._sharedPreferences);
  ////////////////////////////////////////////////////////// language
  @override
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLanguage);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.english.getCode();
    }
  }

  @override
  Future<void> setLocale(Locale locale) async {
    if (locale == LocalizationUtils.arabicLocal) {
      _sharedPreferences.setString(
          prefsKeyLanguage, LanguageType.arabic.getCode());
    } else {
      _sharedPreferences.setString(
          prefsKeyLanguage, LanguageType.english.getCode());
    }
  }

  @override
  Future<Locale> getLocale() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.arabic.getCode()) {
      return LocalizationUtils.arabicLocal;
    } else {
      return LocalizationUtils.englishLocal;
    }
  }

  ////////////////////////////////////////////////////////// theme
  @override
  Future<String> getAppThemeName() async {
    String? themeName = _sharedPreferences.getString(prefsKeyTheme);
    if (themeName != null && themeName.isNotEmpty) {
      return themeName;
    } else {
      // return default theme
      return ThemeMode.system.getName();
    }
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    if (theme == ThemeMode.light) {
      _sharedPreferences.setString(prefsKeyTheme, ThemeMode.light.getName());
    } else if (theme == ThemeMode.dark) {
      _sharedPreferences.setString(prefsKeyTheme, ThemeMode.dark.getName());
    } else {
      _sharedPreferences.setString(prefsKeyTheme, ThemeMode.system.getName());
    }
  }

  @override
  Future<ThemeMode> getTheme() async {
    String currentTheme = await getAppThemeName();

    if (currentTheme == ThemeMode.light.getName()) {
      return ThemeMode.light;
    } else if (currentTheme == ThemeMode.dark.getName()) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  ////////////////////////////////////////////////////////// user logged in
  @override
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  ////////////////////////////////////////////////////////// remove all prefs
  @override
  Future<void> removePrefs() async {
    _sharedPreferences.remove(prefsKeyLanguage);
    _sharedPreferences.remove(prefsKeyTheme);
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }
}
