import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../presentation/resources/conistants_manager.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  String get displayValue {
    switch (this) {
      case Gender.male:
        return S.current.male;
      case Gender.female:
        return S.current.female;
    }
  }
}

enum SortingItem { asc, desc, random }

extension SortingItemExtension on SortingItem {
  String get displayValue {
    switch (this) {
      case SortingItem.asc:
        return S.current.asc;
      case SortingItem.desc:
        return S.current.desc;
      case SortingItem.random:
        return S.current.random;
    }
  }
}

const String light = "light_theme";
const String dark = "dark_theme";
const String system = "system_theme";

extension LanguageTypeExtension on ThemeMode {
  String getName() {
    switch (this) {
      case ThemeMode.light:
        return light;
      case ThemeMode.dark:
        return dark;
      case ThemeMode.system:
        return system;
    }
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return AppConstants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return AppConstants.zero;
    } else {
      return this!;
    }
  }
}
