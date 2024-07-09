import '../generated/l10n.dart';

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
