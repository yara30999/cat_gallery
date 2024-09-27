import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../app/di.dart';
import '../../../../data/data_source/local_data_source.dart';
import '../../../../domain/entities/authentication.dart';
import '../../../../domain/usecase/facebook_sign_in_usecase.dart';
import '../../../../domain/usecase/forgot_password_usecase.dart';
import '../../../../domain/usecase/google_sign_in_usecase.dart';
import '../../../../domain/usecase/login_usecase.dart';
import '../../../../domain/usecase/logout_usecase.dart';
import '../../../../domain/usecase/register_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUsecase _registerUseCase;
  final LogoutUsecase _logoutUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final FacebookSignInUseCase _facebookSignInUseCase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final LocalDataSource _localDataSource = instance();
  AuthCubit(
      this._loginUseCase,
      this._registerUseCase,
      this._logoutUseCase,
      this._googleSignInUseCase,
      this._facebookSignInUseCase,
      this._forgotPasswordUsecase)
      : super(AuthInitial()) {
    // Initialize authObj in the constructor body
    //it can be actual user data or dummy data if the user data is null
    _authObj = _localDataSource.fetchUserData();
  }

  bool modalProgressLoading = false;
  AuthenticationEntity? _authObj;
  String? _errMessage;

  AuthenticationEntity? get authObj => _authObj;
  String? get errMessage => _errMessage;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var result =
        await _loginUseCase.execute(LoginUseCaseInput(email, password));
    result.fold((failure) {
      _errMessage = '${failure.message.toString()} ${failure.code.toString()}';
      emit(LoginFailure());
    }, (authenticationEntity) {
      _authObj = authenticationEntity;
      emit(LoginSuccess());
    });
  }

  Future<void> registerUser(
      {required String userName,
      required String email,
      required String password,
      required String countryMobileCode,
      required String phoneNumber,
      required String gender}) async {
    emit(RegisterLoading());
    var result = await _registerUseCase.execute(RegisterUseCaseInput(
      userName,
      email,
      password,
      countryMobileCode,
      phoneNumber,
      gender,
    ));
    result.fold((failure) {
      _errMessage = '${failure.message.toString()} ${failure.code.toString()}';
      emit(RegisterFailure());
    }, (authenticationEntity) {
      _authObj = authenticationEntity;
      emit(RegisterSuccess());
    });
  }

  Future<void> googleSignIn() async {
    emit(GoogleLoading());
    var result = await _googleSignInUseCase.execute();
    result.fold((failure) {
      _errMessage = '${failure.message.toString()} ${failure.code.toString()}';
      emit(GoogleFailure());
    }, (authenticationEntity) {
      _authObj = authenticationEntity;
/*
      // gives me only uid,name,email.
      print('yara name ${authObj!.name}');
      print('yara email ${authObj!.email}');
      print('yara gender ${authObj!.gender}');
      print('yara phone ${authObj!.phoneNum}');
      print('yara code ${authObj!.countryMobileCode}');
      print('yara uid ${authObj!.uid}');
*/
      emit(GoogleSuccess());
    });
  }

  Future<void> facebookSignIn() async {
    emit(FacebookLoading());
    var result = await _facebookSignInUseCase.execute();
    result.fold((failure) {
      _errMessage = '${failure.message.toString()} ${failure.code.toString()}';
      emit(FacebookFailure());
    }, (authenticationEntity) {
      _authObj = authenticationEntity;
/*
      // gives me only uid,name,email.
      print('yara name ${authObj!.name}');
      print('yara email ${authObj!.email}');
      print('yara gender ${authObj!.gender}');
      print('yara phone ${authObj!.phoneNum}');
      print('yara code ${authObj!.countryMobileCode}');
      print('yara uid ${authObj!.uid}');
*/
      emit(FacebookSuccess());
    });
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    var result = await _logoutUseCase.execute();
    result.fold((failure) {
      emit(LogoutFailure(
          errMessage:
              '${failure.message.toString()} ${failure.code.toString()}'));
    }, (boolSuccess) {
      _authObj = null;
      emit(LogoutSuccess());
    });
  }

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    var result = await _forgotPasswordUsecase.execute(email);
    result.fold((failure) {
      emit(ForgotPasswordFailure(
          errMessage:
              '${failure.message.toString()} ${failure.code.toString()}'));
    }, (boolSuccess) {
      emit(ForgotPasswordSuccess());
    });
  }
}
