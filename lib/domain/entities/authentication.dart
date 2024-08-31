import 'package:hive/hive.dart';
part 'authentication.g.dart';

@HiveType(typeId: 1)
class AuthenticationEntity {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String countryMobileCode;
  @HiveField(4)
  final String phoneNum;
  @HiveField(5)
  final String gender;

  const AuthenticationEntity(
      {required this.uid,
      required this.name,
      required this.email,
      required this.countryMobileCode,
      required this.phoneNum,
      required this.gender});
}
