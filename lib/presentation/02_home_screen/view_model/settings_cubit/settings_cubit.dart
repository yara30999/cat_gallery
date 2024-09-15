import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_prefs.dart';
import '../../../resources/language_manager.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AppPreferences _appPreferences;
  SettingsCubit(this._appPreferences) : super(SettingsInitial());

  Locale currentLocale = LocalizationUtils.englishLocal; //init value
  ThemeMode currentTheme = ThemeMode.light; //init value

  Future<void> setLocale(Locale locale) async {
    emit(LocaleLoading());
    try {
      await _appPreferences.setLocale(locale);
      currentLocale = locale;
      emit(LocaleSuccess());
    } catch (e) {
      emit(LocaleFailure());
    }
  }

  Future<void> getLocale() async {
    emit(LocaleLoading());
    try {
      var curLocale = await _appPreferences.getLocale();
      currentLocale = curLocale;
      emit(LocaleSuccess());
    } catch (e) {
      emit(LocaleFailure());
    }
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    emit(ThemeLoading());
    try {
      await _appPreferences.setTheme(themeMode);
      currentTheme = themeMode;
      emit(ThemeSuccess());
    } catch (e) {
      emit(ThemeFailure());
    }
  }

  Future<void> getTheme() async {
    emit(ThemeLoading());
    try {
      var curTheme = await _appPreferences.getTheme();
      currentTheme = curTheme;
      emit(ThemeSuccess());
    } catch (e) {
      emit(ThemeFailure());
    }
  }
}
