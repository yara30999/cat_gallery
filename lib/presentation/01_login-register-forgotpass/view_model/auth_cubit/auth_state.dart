part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {}

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class LogoutFailure extends AuthState {
  final String errMessage;
  LogoutFailure({required this.errMessage});
}

final class GoogleLoading extends AuthState {}

final class GoogleSuccess extends AuthState {}

final class GoogleFailure extends AuthState {}

final class FacebookLoading extends AuthState {}

final class FacebookSuccess extends AuthState {}

final class FacebookFailure extends AuthState {}

final class ForgotPasswordLoading extends AuthState {}

final class ForgotPasswordSuccess extends AuthState {}

final class ForgotPasswordFailure extends AuthState {
  final String errMessage;
  ForgotPasswordFailure({required this.errMessage});
}
