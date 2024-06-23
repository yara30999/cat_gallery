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
