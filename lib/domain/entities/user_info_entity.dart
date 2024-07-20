import '../../app/extensions.dart';

class UserInfoEntity {
  final String name, email;
  final Gender gender;

  const UserInfoEntity({
    required this.gender,
    required this.name,
    required this.email,
  });
}
