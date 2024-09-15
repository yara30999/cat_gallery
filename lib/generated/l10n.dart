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

  /// `breed: {breedName}`
  String upload_breed(Object breedName) {
    return Intl.message(
      'breed: $breedName',
      name: 'upload_breed',
      desc: '',
      args: [breedName],
    );
  }

  /// `category: {categoryName}`
  String upload_category(Object categoryName) {
    return Intl.message(
      'category: $categoryName',
      name: 'upload_category',
      desc: '',
      args: [categoryName],
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

  /// `0٪`
  String get zero_percent {
    return Intl.message(
      '0٪',
      name: 'zero_percent',
      desc: '',
      args: [],
    );
  }

  /// `10%`
  String get ten_percent {
    return Intl.message(
      '10%',
      name: 'ten_percent',
      desc: '',
      args: [],
    );
  }

  /// `20%`
  String get twenty_percent {
    return Intl.message(
      '20%',
      name: 'twenty_percent',
      desc: '',
      args: [],
    );
  }

  /// `30%`
  String get thirty_percent {
    return Intl.message(
      '30%',
      name: 'thirty_percent',
      desc: '',
      args: [],
    );
  }

  /// `40%`
  String get fourty_percent {
    return Intl.message(
      '40%',
      name: 'fourty_percent',
      desc: '',
      args: [],
    );
  }

  /// `50%`
  String get fifty_percent {
    return Intl.message(
      '50%',
      name: 'fifty_percent',
      desc: '',
      args: [],
    );
  }

  /// `60%`
  String get sixty_percent {
    return Intl.message(
      '60%',
      name: 'sixty_percent',
      desc: '',
      args: [],
    );
  }

  /// `70%`
  String get seventy_percent {
    return Intl.message(
      '70%',
      name: 'seventy_percent',
      desc: '',
      args: [],
    );
  }

  /// `80%`
  String get eighty_percent {
    return Intl.message(
      '80%',
      name: 'eighty_percent',
      desc: '',
      args: [],
    );
  }

  /// `90%`
  String get ninty_percent {
    return Intl.message(
      '90%',
      name: 'ninty_percent',
      desc: '',
      args: [],
    );
  }

  /// `100%`
  String get handred_percent {
    return Intl.message(
      '100%',
      name: 'handred_percent',
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

  /// `image analysis`
  String get image_analysis {
    return Intl.message(
      'image analysis',
      name: 'image_analysis',
      desc: '',
      args: [],
    );
  }

  /// `we are using AWS Rekognition.`
  String get we_are_using_AWS_Rekognition {
    return Intl.message(
      'we are using AWS Rekognition.',
      name: 'we_are_using_AWS_Rekognition',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get go_back {
    return Intl.message(
      'Go Back',
      name: 'go_back',
      desc: '',
      args: [],
    );
  }

  /// `Mr. `
  String get mr {
    return Intl.message(
      'Mr. ',
      name: 'mr',
      desc: '',
      args: [],
    );
  }

  /// `Mrs. `
  String get mrs {
    return Intl.message(
      'Mrs. ',
      name: 'mrs',
      desc: '',
      args: [],
    );
  }

  /// `App developer: \nEng. Yara Nasser Elniny\n yaranasserelniny@gmail.com`
  String get app_developer {
    return Intl.message(
      'App developer: \nEng. Yara Nasser Elniny\n yaranasserelniny@gmail.com',
      name: 'app_developer',
      desc: '',
      args: [],
    );
  }

  /// `Theme:`
  String get Theme {
    return Intl.message(
      'Theme:',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get System {
    return Intl.message(
      'System',
      name: 'System',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Language:`
  String get Language {
    return Intl.message(
      'Language:',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Logout account`
  String get Logout_account {
    return Intl.message(
      'Logout account',
      name: 'Logout_account',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load image.`
  String get Failed_to_load_image {
    return Intl.message(
      'Failed to load image.',
      name: 'Failed_to_load_image',
      desc: '',
      args: [],
    );
  }

  /// `upload cat image`
  String get upload_image {
    return Intl.message(
      'upload cat image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Remember: The image you upload must contain a cat, otherwise it will not be uploaded.`
  String get remember {
    return Intl.message(
      'Remember: The image you upload must contain a cat, otherwise it will not be uploaded.',
      name: 'remember',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Add image file.`
  String get add_image_file {
    return Intl.message(
      'Add image file.',
      name: 'add_image_file',
      desc: '',
      args: [],
    );
  }

  /// `Click or Drag image file.`
  String get click_or_drag_image_file {
    return Intl.message(
      'Click or Drag image file.',
      name: 'click_or_drag_image_file',
      desc: '',
      args: [],
    );
  }

  /// `Selected category: {categoryName}`
  String selected_category(Object categoryName) {
    return Intl.message(
      'Selected category: $categoryName',
      name: 'selected_category',
      desc: '',
      args: [categoryName],
    );
  }

  /// `Nothing`
  String get nothing {
    return Intl.message(
      'Nothing',
      name: 'nothing',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get Optional {
    return Intl.message(
      'Optional',
      name: 'Optional',
      desc: '',
      args: [],
    );
  }

  /// `Select Category:`
  String get select_category {
    return Intl.message(
      'Select Category:',
      name: 'select_category',
      desc: '',
      args: [],
    );
  }

  /// `I don't know the category.`
  String get do_not_know_category {
    return Intl.message(
      'I don\'t know the category.',
      name: 'do_not_know_category',
      desc: '',
      args: [],
    );
  }

  /// `Selected breed: {breedName}`
  String selected_breed(Object breedName) {
    return Intl.message(
      'Selected breed: $breedName',
      name: 'selected_breed',
      desc: '',
      args: [breedName],
    );
  }

  /// `Select Breed:`
  String get select_breed {
    return Intl.message(
      'Select Breed:',
      name: 'select_breed',
      desc: '',
      args: [],
    );
  }

  /// `I don't know the breed.`
  String get do_not_know_breed {
    return Intl.message(
      'I don\'t know the breed.',
      name: 'do_not_know_breed',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `success`
  String get success {
    return Intl.message(
      'success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `bad request. try again later`
  String get bad_request_error {
    return Intl.message(
      'bad request. try again later',
      name: 'bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `incorrect certificate`
  String get incorrect_certificate_error {
    return Intl.message(
      'incorrect certificate',
      name: 'incorrect_certificate_error',
      desc: '',
      args: [],
    );
  }

  /// `user unauthorized, try again later`
  String get unauthorized_error {
    return Intl.message(
      'user unauthorized, try again later',
      name: 'unauthorized_error',
      desc: '',
      args: [],
    );
  }

  /// `forbidden request. try again later`
  String get forbidden_error {
    return Intl.message(
      'forbidden request. try again later',
      name: 'forbidden_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get internal_server_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `url not found, try again later`
  String get not_found_error {
    return Intl.message(
      'url not found, try again later',
      name: 'not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `Time out error, Try again later`
  String get connection_timeout_error {
    return Intl.message(
      'Time out error, Try again later',
      name: 'connection_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Request was cancelled, Try again later`
  String get cancel_error {
    return Intl.message(
      'Request was cancelled, Try again later',
      name: 'cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `Recieve time out error, Try again later`
  String get recieve_timeout_error {
    return Intl.message(
      'Recieve time out error, Try again later',
      name: 'recieve_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Send time out error, Try again later`
  String get send_timeout_error {
    return Intl.message(
      'Send time out error, Try again later',
      name: 'send_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `cache error, try again later`
  String get cache_error {
    return Intl.message(
      'cache error, try again later',
      name: 'cache_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get no_internet_connection_error {
    return Intl.message(
      'Please check your internet connection',
      name: 'no_internet_connection_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get unknown_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `success with not content`
  String get no_content {
    return Intl.message(
      'success with not content',
      name: 'no_content',
      desc: '',
      args: [],
    );
  }

  /// `conflict found, try again later`
  String get conflict_error {
    return Intl.message(
      'conflict found, try again later',
      name: 'conflict_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get default_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'default_error',
      desc: '',
      args: [],
    );
  }

  /// `Loading ...`
  String get loading {
    return Intl.message(
      'Loading ...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Google sign-in was canceled or failed`
  String get google {
    return Intl.message(
      'Google sign-in was canceled or failed',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Facebook sign-in was canceled or failed`
  String get facebook {
    return Intl.message(
      'Facebook sign-in was canceled or failed',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get week_password {
    return Intl.message(
      'The password provided is too weak.',
      name: 'week_password',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get email_exists {
    return Intl.message(
      'The account already exists for that email.',
      name: 'email_exists',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get user_not_found {
    return Intl.message(
      'No user found for that email.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrong_password {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password or username.`
  String get invalid_credential {
    return Intl.message(
      'Wrong password or username.',
      name: 'invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests, please try again later.`
  String get too_many_requests {
    return Intl.message(
      'Too many requests, please try again later.',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, this email is invalid.`
  String get invalid_email {
    return Intl.message(
      'Sorry, this email is invalid.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Operation not allowed, please try again later.`
  String get opration_not_allowed {
    return Intl.message(
      'Operation not allowed, please try again later.',
      name: 'opration_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `This account exists with different credential.`
  String get different_credential {
    return Intl.message(
      'This account exists with different credential.',
      name: 'different_credential',
      desc: '',
      args: [],
    );
  }

  /// `The continue URL provided in the request is invalid.`
  String get invalid_continue_uri {
    return Intl.message(
      'The continue URL provided in the request is invalid.',
      name: 'invalid_continue_uri',
      desc: '',
      args: [],
    );
  }

  /// `The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.`
  String get unauthorized_continue_uri {
    return Intl.message(
      'The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.',
      name: 'unauthorized_continue_uri',
      desc: '',
      args: [],
    );
  }

  /// `No worries, we will send you reset instructions.`
  String get no_worries {
    return Intl.message(
      'No worries, we will send you reset instructions.',
      name: 'no_worries',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_password {
    return Intl.message(
      'Reset password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Go back to login`
  String get go_back_to_login {
    return Intl.message(
      'Go back to login',
      name: 'go_back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Reset password mail has been sent successfully to your email, go check.`
  String get reset_password_mail_sent {
    return Intl.message(
      'Reset password mail has been sent successfully to your email, go check.',
      name: 'reset_password_mail_sent',
      desc: '',
      args: [],
    );
  }

  /// `No more cat images.`
  String get no_more_cat_images {
    return Intl.message(
      'No more cat images.',
      name: 'no_more_cat_images',
      desc: '',
      args: [],
    );
  }

  /// `There is no images in this category section.`
  String get no_images_category {
    return Intl.message(
      'There is no images in this category section.',
      name: 'no_images_category',
      desc: '',
      args: [],
    );
  }

  /// `You haven't voted on any image yet.`
  String get no_votes_yet {
    return Intl.message(
      'You haven\'t voted on any image yet.',
      name: 'no_votes_yet',
      desc: '',
      args: [],
    );
  }

  /// `You haven't liked any image yet.`
  String get no_favourites_yet {
    return Intl.message(
      'You haven\'t liked any image yet.',
      name: 'no_favourites_yet',
      desc: '',
      args: [],
    );
  }

  /// `You haven't uploaded any image yet.`
  String get no_uploads_yet {
    return Intl.message(
      'You haven\'t uploaded any image yet.',
      name: 'no_uploads_yet',
      desc: '',
      args: [],
    );
  }

  /// `There are no images availabel for this breed.`
  String get no_breed_images {
    return Intl.message(
      'There are no images availabel for this breed.',
      name: 'no_breed_images',
      desc: '',
      args: [],
    );
  }

  /// `You haven't selected any cat image to upload.`
  String get no_image_to_upload {
    return Intl.message(
      'You haven\'t selected any cat image to upload.',
      name: 'no_image_to_upload',
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
