import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'language_manager.dart';

abstract class Styles {
  /*.................. used in 
  -login screen
  */
  static TextStyle style18semiBold(BuildContext context,
      {required String englishFontFamily}) {
    switch (Intl.getCurrentLocale()) {
      case arabic:
        return TextStyle(
          fontFamily: FontConstants.fontArCairo,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
          fontWeight: FontWeightManager.semiBold,
          color: ColorManager.pink1,
        );
      default:
        return TextStyle(
          fontFamily: englishFontFamily,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
          fontWeight: FontWeightManager.semiBold,
          color: ColorManager.pink1,
        );
    }
  }

  /*..................used in 
  -login divider
  */
  static TextStyle style20Bold(BuildContext context,
      {required String englishFontFamily}) {
    switch (Intl.getCurrentLocale()) {
      case arabic:
        return TextStyle(
            fontFamily: FontConstants.fontArCairo,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
            fontWeight: FontWeightManager.regular,
            color: ColorManager.grey);
      default:
        return TextStyle(
            fontFamily: englishFontFamily,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
            fontWeight: FontWeightManager.bold,
            color: ColorManager.grey);
    }
  }

  /*..................used in 
  -login button
  -the two texts in login screen
  */
  static TextStyle style30Bold(BuildContext context,
      {required String englishFontFamily}) {
    switch (Intl.getCurrentLocale()) {
      case arabic:
        return TextStyle(
            fontFamily: FontConstants.fontArCairo,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
            fontWeight: FontWeightManager.regular,
            letterSpacing: 1.4);
      default:
        return TextStyle(
            fontFamily: englishFontFamily,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
            fontWeight: FontWeightManager.bold,
            letterSpacing: 1.4);
    }
  }

  static TextStyle style40Black(BuildContext context,
      {required String englishFontFamily}) {
    switch (Intl.getCurrentLocale()) {
      case arabic:
        return TextStyle(
          fontFamily: FontConstants.fontArCairo,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s36),
          fontWeight: FontWeightManager.medium,
        );
      default:
        return TextStyle(
            fontFamily: englishFontFamily,
            fontSize: getResponsiveFontSize(context, fontSize: FontSize.s36),
            fontWeight: FontWeightManager.black,
            letterSpacing: 1.4);
    }
  }

  static TextStyle style18Medium(BuildContext context,
      {required String englishFontFamily}) {
    switch (Intl.getCurrentLocale()) {
      case arabic:
        return TextStyle(
          fontFamily: FontConstants.fontArCairo,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
          fontWeight: FontWeightManager.medium,
        );
      default:
        return TextStyle(
          fontFamily: englishFontFamily,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
          fontWeight: FontWeightManager.medium,
        );
    }
  }

  static TextStyle style18Bold(BuildContext context,
      {required String englishFontFamily}) {
    switch (Intl.getCurrentLocale()) {
      case arabic:
        return TextStyle(
          fontFamily: FontConstants.fontArCairo,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
          fontWeight: FontWeightManager.bold,
        );
      default:
        return TextStyle(
          fontFamily: englishFontFamily,
          fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
          fontWeight: FontWeightManager.bold,
        );
    }
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSizeWithLimits =
      responsiveFontSize.clamp(lowerLimit, upperLimit);

  return responsiveFontSizeWithLimits;
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  const breakPointMobileTablet = 800;
  const breakPointTabletLaptop = 1200;
  if (width < breakPointMobileTablet) {
    return width / 550;
  } else if (width < breakPointTabletLaptop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
