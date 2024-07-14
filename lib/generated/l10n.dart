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

  /// `Cat Gallery`
  String get cat_gallery {
    return Intl.message(
      'Cat Gallery',
      name: 'cat_gallery',
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

  /// `Search country`
  String get search_country {
    return Intl.message(
      'Search country',
      name: 'search_country',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Do not type the country code again`
  String get do_not_type_country_code_again {
    return Intl.message(
      'Do not type the country code again',
      name: 'do_not_type_country_code_again',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phone_number_is_required {
    return Intl.message(
      'Phone number is required',
      name: 'phone_number_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get please_enter_a_valid_phone_number {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'please_enter_a_valid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number length is invalid`
  String get phone_number_length_invalid {
    return Intl.message(
      'Phone number length is invalid',
      name: 'phone_number_length_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Country data not found`
  String get country_number_length_not_found {
    return Intl.message(
      'Country data not found',
      name: 'country_number_length_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Gender is required`
  String get genderRequired {
    return Intl.message(
      'Gender is required',
      name: 'genderRequired',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get selectGender {
    return Intl.message(
      'Select Gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Uploads`
  String get Uploads {
    return Intl.message(
      'Uploads',
      name: 'Uploads',
      desc: '',
      args: [],
    );
  }

  /// `Votes`
  String get Votes {
    return Intl.message(
      'Votes',
      name: 'Votes',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get Vote {
    return Intl.message(
      'Vote',
      name: 'Vote',
      desc: '',
      args: [],
    );
  }

  /// `Search by breed name...`
  String get Search_by_breed_name {
    return Intl.message(
      'Search by breed name...',
      name: 'Search_by_breed_name',
      desc: '',
      args: [],
    );
  }

  /// `main breeds`
  String get main_breeds {
    return Intl.message(
      'main breeds',
      name: 'main_breeds',
      desc: '',
      args: [],
    );
  }

  /// `Browse random images of all breeds.`
  String get Browse_random_images_of_all_breeds {
    return Intl.message(
      'Browse random images of all breeds.',
      name: 'Browse_random_images_of_all_breeds',
      desc: '',
      args: [],
    );
  }

  /// ` Or choose a specific cat breed to browse images with.`
  String get main_breed_paragraph {
    return Intl.message(
      ' Or choose a specific cat breed to browse images with.',
      name: 'main_breed_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `random cat images`
  String get random_cat_images {
    return Intl.message(
      'random cat images',
      name: 'random_cat_images',
      desc: '',
      args: [],
    );
  }

  /// `{breedName} cat images`
  String breed_cat_images(Object breedName) {
    return Intl.message(
      '$breedName cat images',
      name: 'breed_cat_images',
      desc: '',
      args: [breedName],
    );
  }

  /// `all`
  String get all {
    return Intl.message(
      'all',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `hats`
  String get hats {
    return Intl.message(
      'hats',
      name: 'hats',
      desc: '',
      args: [],
    );
  }

  /// `space`
  String get space {
    return Intl.message(
      'space',
      name: 'space',
      desc: '',
      args: [],
    );
  }

  /// `funny`
  String get funny {
    return Intl.message(
      'funny',
      name: 'funny',
      desc: '',
      args: [],
    );
  }

  /// `sunglasses`
  String get sunglasses {
    return Intl.message(
      'sunglasses',
      name: 'sunglasses',
      desc: '',
      args: [],
    );
  }

  /// `boxes`
  String get boxes {
    return Intl.message(
      'boxes',
      name: 'boxes',
      desc: '',
      args: [],
    );
  }

  /// `caturday`
  String get caturday {
    return Intl.message(
      'caturday',
      name: 'caturday',
      desc: '',
      args: [],
    );
  }

  /// `ties`
  String get ties {
    return Intl.message(
      'ties',
      name: 'ties',
      desc: '',
      args: [],
    );
  }

  /// `boys`
  String get boys {
    return Intl.message(
      'boys',
      name: 'boys',
      desc: '',
      args: [],
    );
  }

  /// `dream`
  String get dream {
    return Intl.message(
      'dream',
      name: 'dream',
      desc: '',
      args: [],
    );
  }

  /// `kittens`
  String get kittens {
    return Intl.message(
      'kittens',
      name: 'kittens',
      desc: '',
      args: [],
    );
  }

  /// `psychedelic`
  String get psychedelic {
    return Intl.message(
      'psychedelic',
      name: 'psychedelic',
      desc: '',
      args: [],
    );
  }

  /// `girls`
  String get girls {
    return Intl.message(
      'girls',
      name: 'girls',
      desc: '',
      args: [],
    );
  }

  /// `breaded`
  String get breaded {
    return Intl.message(
      'breaded',
      name: 'breaded',
      desc: '',
      args: [],
    );
  }

  /// `sinks`
  String get sinks {
    return Intl.message(
      'sinks',
      name: 'sinks',
      desc: '',
      args: [],
    );
  }

  /// `clothes`
  String get clothes {
    return Intl.message(
      'clothes',
      name: 'clothes',
      desc: '',
      args: [],
    );
  }

  /// `ascending`
  String get asc {
    return Intl.message(
      'ascending',
      name: 'asc',
      desc: '',
      args: [],
    );
  }

  /// `descending`
  String get desc {
    return Intl.message(
      'descending',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `random`
  String get random {
    return Intl.message(
      'random',
      name: 'random',
      desc: '',
      args: [],
    );
  }

  /// `Adaptability`
  String get adabtability {
    return Intl.message(
      'Adaptability',
      name: 'adabtability',
      desc: '',
      args: [],
    );
  }

  /// `Child Friendly`
  String get child_friendly {
    return Intl.message(
      'Child Friendly',
      name: 'child_friendly',
      desc: '',
      args: [],
    );
  }

  /// `Dog Friendly`
  String get dog_friendly {
    return Intl.message(
      'Dog Friendly',
      name: 'dog_friendly',
      desc: '',
      args: [],
    );
  }

  /// `Stranger Friendly`
  String get stranger_friendly {
    return Intl.message(
      'Stranger Friendly',
      name: 'stranger_friendly',
      desc: '',
      args: [],
    );
  }

  /// `Health Issues`
  String get health_issues {
    return Intl.message(
      'Health Issues',
      name: 'health_issues',
      desc: '',
      args: [],
    );
  }

  /// `Social Needs`
  String get social_needs {
    return Intl.message(
      'Social Needs',
      name: 'social_needs',
      desc: '',
      args: [],
    );
  }

  /// `Shedding`
  String get shedding {
    return Intl.message(
      'Shedding',
      name: 'shedding',
      desc: '',
      args: [],
    );
  }

  /// `Affection`
  String get affection {
    return Intl.message(
      'Affection',
      name: 'affection',
      desc: '',
      args: [],
    );
  }

  /// `Energy`
  String get energy {
    return Intl.message(
      'Energy',
      name: 'energy',
      desc: '',
      args: [],
    );
  }

  /// `Grooming`
  String get grooming {
    return Intl.message(
      'Grooming',
      name: 'grooming',
      desc: '',
      args: [],
    );
  }

  /// `Intelligence`
  String get intelligence {
    return Intl.message(
      'Intelligence',
      name: 'intelligence',
      desc: '',
      args: [],
    );
  }

  /// `0`
  String get zero {
    return Intl.message(
      '0',
      name: 'zero',
      desc: '',
      args: [],
    );
  }

  /// `1`
  String get one {
    return Intl.message(
      '1',
      name: 'one',
      desc: '',
      args: [],
    );
  }

  /// `2`
  String get two {
    return Intl.message(
      '2',
      name: 'two',
      desc: '',
      args: [],
    );
  }

  /// `3`
  String get three {
    return Intl.message(
      '3',
      name: 'three',
      desc: '',
      args: [],
    );
  }

  /// `4`
  String get four {
    return Intl.message(
      '4',
      name: 'four',
      desc: '',
      args: [],
    );
  }

  /// `5`
  String get five {
    return Intl.message(
      '5',
      name: 'five',
      desc: '',
      args: [],
    );
  }

  /// `The {catBreed} has a weight range of {weightImperial} pounds ({weightMetric} kg).`
  String cat_weight_range(
      Object catBreed, Object weightImperial, Object weightMetric) {
    return Intl.message(
      'The $catBreed has a weight range of $weightImperial pounds ($weightMetric kg).',
      name: 'cat_weight_range',
      desc: '',
      args: [catBreed, weightImperial, weightMetric],
    );
  }

  /// `These cats possess a temperament that is {temperament}.`
  String cat_temperament(Object temperament) {
    return Intl.message(
      'These cats possess a temperament that is $temperament.',
      name: 'cat_temperament',
      desc: '',
      args: [temperament],
    );
  }

  /// `Their typical lifespan ranges from {lifeSpan} years.`
  String cat_lifespan(Object lifeSpan) {
    return Intl.message(
      'Their typical lifespan ranges from $lifeSpan years.',
      name: 'cat_lifespan',
      desc: '',
      args: [lifeSpan],
    );
  }

  /// `The breed originates from {origin}.`
  String cat_origin(Object origin) {
    return Intl.message(
      'The breed originates from $origin.',
      name: 'cat_origin',
      desc: '',
      args: [origin],
    );
  }

  /// `For more information, you can visit their `
  String get more_information {
    return Intl.message(
      'For more information, you can visit their ',
      name: 'more_information',
      desc: '',
      args: [],
    );
  }

  /// `Vetstreet page`
  String get vetstreet_page {
    return Intl.message(
      'Vetstreet page',
      name: 'vetstreet_page',
      desc: '',
      args: [],
    );
  }

  /// `Wikipedia page`
  String get wikipedia_page {
    return Intl.message(
      'Wikipedia page',
      name: 'wikipedia_page',
      desc: '',
      args: [],
    );
  }

  /// ` or `
  String get or {
    return Intl.message(
      ' or ',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
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
