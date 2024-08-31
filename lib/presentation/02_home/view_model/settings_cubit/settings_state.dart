part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class LocaleLoading extends SettingsState {}

final class LocaleSuccess extends SettingsState {}

final class LocaleFailure extends SettingsState {}

final class ThemeLoading extends SettingsState {}

final class ThemeSuccess extends SettingsState {}

final class ThemeFailure extends SettingsState {}
