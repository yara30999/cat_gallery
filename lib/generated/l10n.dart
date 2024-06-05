// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `no_route_found`
  String get noRouteFound {
    return Intl.message(
      'no_route_found',
      name: 'noRouteFound',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get hello {
    return Intl.message(
      'Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign into your Account.`
  String get loginTitle {
    return Intl.message(
      'Sign into your Account.',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email Id`
  String get emailLabel {
    return Intl.message(
      'Email Id',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get passwordConfirmLabel {
    return Intl.message(
      'Confirm Password',
      name: 'passwordConfirmLabel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginLabel {
    return Intl.message(
      'Login',
      name: 'loginLabel',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerLabel {
    return Intl.message(
      'Register',
      name: 'registerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot Your Password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue With`
  String get orContinueWith {
    return Intl.message(
      'Or Continue With',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get notAMember {
    return Intl.message(
      'Not a member?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get emptyMsg {
    return Intl.message(
      'Field is required',
      name: 'emptyMsg',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get passwordNotValid {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'passwordNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Username too short`
  String get usernameTooShort {
    return Intl.message(
      'Username too short',
      name: 'usernameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Username too long`
  String get usernameTooLong {
    return Intl.message(
      'Username too long',
      name: 'usernameTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Username not valid`
  String get usernameNotValid {
    return Intl.message(
      'Username not valid',
      name: 'usernameNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Email not formatted well`
  String get emailNotValid {
    return Intl.message(
      'Email not formatted well',
      name: 'emailNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Flutter cat information app`
  String get appTitle {
    return Intl.message(
      'Flutter cat information app',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
