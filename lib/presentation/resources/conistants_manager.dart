import 'package:flutter/material.dart';

class AppConstants {
  static const int splashDelay = 2;
  static const int onboardingDelay = 3;
  static const int refreshDelay = 2;
  static const int waitDelay = 2;
  static const String baseUrl = "https://api.thecatapi.com/";
  //it is a free xApiKey from https://thecatapi.com/
  static const String xApiKey =
      "live_fRl8P1uYl7wNnQ1DQvv8mIp2OQohecbeIr2ytN0dS2Zoq8u8TWUuJxSaY3lQ5IIG";
  static const String token = "SEND TOKEN HERE";
  static const String empty = "";
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
