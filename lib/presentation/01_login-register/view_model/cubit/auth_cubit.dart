import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var auth = FirebaseAuth.instance;
  bool modalProgressLoading = false;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log(credential.user!.email.toString()); //TODO see what user have here
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginFailure(errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(LoginFailure(
            errMessage:
                'Failed with error:${e.message.toString()} \n and code ${e.code.toString()}'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      final UserCredential credential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log(credential.user!.displayName.toString());
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errMessage: 'The account already exists for that email.'));
      } else {
        emit(RegisterFailure(
            errMessage:
                'Failed with error:${e.message.toString()} \n and code ${e.code.toString()}'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(errMessage: e.toString()));
    }
  }
}
