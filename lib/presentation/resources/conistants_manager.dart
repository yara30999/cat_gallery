import 'package:flutter/material.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const int onboardingDelay = 5;
  static const int refreshDelay = 2;
  static const String baseUrl = "https://api.thecatapi.com/";
  static const String empty = "";
  static const String token = "SEND TOKEN HERE";
  static const int zero = 0;
  static const Duration apiTimeOut = Duration(minutes: 2);
  static const List<String> favoriteCountries = [
    'EG',
    'AE',
    'SA',
    "US",
    "GB",
    "CA",
    "BR"
  ];
  static const String initialCountryISO = "EG";
  static const String initialCountryCode = "+20";
  static const double appBarHeight = kToolbarHeight * 2;
  static const int breakPointMobileTablet = 800; //1100
  static const int breakPointTabletLaptop = 1200; //1700
  static const String google = 'google';
  static const String facebook = 'facebook';
  static const String kBreedsBox = 'kBreedsBox';
  static const String kUserDataBox = 'kUserDataBox';
}
