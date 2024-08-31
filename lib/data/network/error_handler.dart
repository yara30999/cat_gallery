import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../generated/l10n.dart';
import '../../presentation/resources/conistants_manager.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else if (error is StateError) {
      // this is exception that i throw by myself :)
      failure = _handleStateError(error);
    } else if (error is FirebaseAuthException) {
      // from login or register
      failure = _firebaseError(error);
    } else {
      // default error
      failure = DataSource.unknown.getFailure();
    }
  }
}

Failure _firebaseError(FirebaseAuthException error) {
  switch (error.code) {
    case 'weak-password':
      return FirebaseSource.weekPassword.getFailure();
    case 'wrong-password':
      return FirebaseSource.wrongPassword.getFailure();
    case 'user-not-found':
      return FirebaseSource.userNotFound.getFailure();
    case 'email-already-in-use':
      return FirebaseSource.emailExists.getFailure();
    case 'invalid-credential':
      return FirebaseSource.invalidCredential.getFailure();
    case 'too-many-requests':
      return FirebaseSource.tooManyRequests.getFailure();
    case 'operation-not-allowed':
      return FirebaseSource.operationNotAllowed.getFailure();
    case 'invalid-email':
      return FirebaseSource.invalidEmail.getFailure();
    case 'account-exists-with-different-credential':
      return FirebaseSource.differentCredential.getFailure();
    case 'invalid-continue-uri':
      return FirebaseSource.invalidContinueUrl.getFailure();
    case 'unauthorized-continue-uri':
      return FirebaseSource.unauthorizedContinueUri.getFailure();
    default:
      return DataSource.unknown.getFailure();
  }
}

Failure _handleStateError(StateError stateError) {
  switch (stateError.message) {
    case AppConstants.google:
      return AuthSource.googleFailed.getFailure();
    case AppConstants.facebook:
      return AuthSource.facebookFailed.getFailure();
    default:
      return DataSource.unknown.getFailure();
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    /// Caused by a connection timeout.
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();

    /// It occurs when url is sent timeout.
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();

    ///It occurs when receiving timeout.
    case DioExceptionType.receiveTimeout:
      return DataSource.recieveTimeout.getFailure();

    /// Caused by an incorrect certificate as configured by [ValidateCertificate].
    case DioExceptionType.badCertificate:
      return DataSource.badCertificate.getFailure();

    /// The [DioException] was caused by an incorrect status code as configured by [ValidateStatus].
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.unknown.getFailure();
      }

    /// When the request is cancelled, dio will throw a error with this type.
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();

    /// Caused for example by a `xhr.onError` or SocketExceptions.
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();

    /// Default error type, Some other [Error]. In this case, you can use the
    /// [DioException.error] if it is not null.
    case DioExceptionType.unknown:
      return DataSource.unknown.getFailure();
  }
}

enum DataSource {
  success,
  noContect,
  badRequest,
  badCertificate,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  recieveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContect:
        return Failure(ResponseCode.noContect, ResponseMessage.noContect);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.badCertificate:
        return Failure(
            ResponseCode.badCertificate, ResponseMessage.badCertificate);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectionTimeout:
        return Failure(
            ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.recieveTimeout:
        return Failure(
            ResponseCode.recieveTimeout, ResponseMessage.recieveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.unknown:
        return Failure(ResponseCode.unknown, ResponseMessage.unknown);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContect = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int badCertificate = 42; //
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  // local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int recieveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}

class ResponseMessage {
  static String success = S.current.success; // success with data
  static String noContect =
      S.current.success; // success with no data (no content)
  static String badRequest =
      S.current.bad_request_error; // failure, API rejected request
  static String badCertificate =
      S.current.incorrect_certificate_error; //incorrect certificate
  static String unauthorized =
      S.current.unauthorized_error; // failure, user is not authorised
  static String forbidden =
      S.current.forbidden_error; //  failure, API rejected request
  static String internalServerError =
      S.current.internal_server_error; // failure, crash in server side
  static String notFound =
      S.current.not_found_error; // failure, crash in server side
  // local status code
  static String connectionTimeout = S.current.connection_timeout_error;
  static String cancel = S.current.cancel_error;
  static String recieveTimeout = S.current.recieve_timeout_error;
  static String sendTimeout = S.current.send_timeout_error;
  static String cacheError = S.current.cache_error;
  static String noInternetConnection = S.current.no_internet_connection_error;
  static String unknown = S.current.unknown_error;
}

extension AuthSourceExtension on AuthSource {
  Failure getFailure() {
    switch (this) {
      case AuthSource.googleFailed:
        return Failure(ResponseCode.unknown, AuthMessage.google);
      case AuthSource.facebookFailed:
        return Failure(ResponseCode.unknown, AuthMessage.facebook);
    }
  }
}

enum AuthSource {
  googleFailed,
  facebookFailed,
}

class AuthMessage {
  static String google = S.current.google;
  static String facebook = S.current.facebook;
}

extension FirebaseSourceExtension on FirebaseSource {
  Failure getFailure() {
    switch (this) {
      case FirebaseSource.weekPassword:
        return Failure(ResponseCode.unknown, FirebaseMessage.weekPassword);
      case FirebaseSource.wrongPassword:
        return Failure(ResponseCode.unknown, FirebaseMessage.wrongPassword);
      case FirebaseSource.userNotFound:
        return Failure(ResponseCode.unknown, FirebaseMessage.userNotFound);
      case FirebaseSource.emailExists:
        return Failure(ResponseCode.unknown, FirebaseMessage.emailExists);
      case FirebaseSource.invalidCredential:
        return Failure(ResponseCode.unknown, FirebaseMessage.invalidCredential);
      case FirebaseSource.tooManyRequests:
        return Failure(ResponseCode.unknown, FirebaseMessage.tooManyRequests);
      case FirebaseSource.invalidEmail:
        return Failure(ResponseCode.unknown, FirebaseMessage.invalidEmail);
      case FirebaseSource.operationNotAllowed:
        return Failure(
            ResponseCode.unknown, FirebaseMessage.oprationNotAllowed);
      case FirebaseSource.differentCredential:
        return Failure(
            ResponseCode.unknown, FirebaseMessage.differentCredential);
      case FirebaseSource.invalidContinueUrl:
        return Failure(
            ResponseCode.unknown, FirebaseMessage.invalidContinueUrl);
      case FirebaseSource.unauthorizedContinueUri:
        return Failure(
            ResponseCode.unknown, FirebaseMessage.unauthorizedContinueUri);
    }
  }
}

enum FirebaseSource {
  weekPassword,
  emailExists,
  userNotFound,
  wrongPassword,
  invalidCredential,
  invalidEmail,
  operationNotAllowed,
  tooManyRequests,
  differentCredential,
  invalidContinueUrl,
  unauthorizedContinueUri
}

class FirebaseMessage {
  static String weekPassword = S.current.week_password;
  static String emailExists = S.current.email_exists;
  static String userNotFound = S.current.user_not_found;
  static String wrongPassword = S.current.wrong_password;
  static String invalidCredential = S.current.invalid_credential;
  static String tooManyRequests = S.current.too_many_requests;
  static String invalidEmail = S.current.invalid_email;
  static String oprationNotAllowed = S.current.opration_not_allowed;
  static String differentCredential = S.current.different_credential;
  static String invalidContinueUrl = S.current.invalid_continue_uri;
  static String unauthorizedContinueUri = S.current.unauthorized_continue_uri;
}
// class ApiInternalStatus {
//   static const int success = 0;
//   static const int failure = 1;
// }
