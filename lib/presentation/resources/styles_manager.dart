import 'dart:ui';

import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'conistants_manager.dart';
import 'font_manager.dart';

abstract class Styles {
  static TextStyle style8Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s8),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style10Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s10),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style12Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s12),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style12Regular() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s12),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle style14Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s14),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style16Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s16),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style16Regular() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s16),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle style16Light() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s16),
      fontWeight: FontWeightManager.light,
    );
  }

  static TextStyle style18Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s18),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style18Bold() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s18),
      fontWeight: FontWeightManager.bold,
    );
  }

  /*.................. used in 
  -login screen
  */
  static TextStyle style18semiBold() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s18),
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.pink1,
    );
  }

  /*..................used in 
  -login divider
  */
  static TextStyle style20Regular() {
    return TextStyle(
        fontFamily: FontConstants.fontMarhey,
        fontSize: getResponsiveFontSize(fontSize: FontSize.s20),
        fontWeight: FontWeightManager.regular,
        color: ColorManager.grey1);
  }

  static TextStyle style22Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s22),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style24Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s24),
      fontWeight: FontWeightManager.medium,
    );
  }

  /*..................used in 
  -login button
  -the two texts in login screen
  */
  static TextStyle style30Bold() {
    return TextStyle(
        fontFamily: FontConstants.fontMarhey,
        fontSize: getResponsiveFontSize(fontSize: FontSize.s30),
        fontWeight: FontWeightManager.bold,
        letterSpacing: 1.4);
  }

  static TextStyle style36Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(fontSize: FontSize.s36),
      fontWeight: FontWeightManager.medium,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSizeWithLimits =
      responsiveFontSize.clamp(lowerLimit, upperLimit);

  return responsiveFontSizeWithLimits;
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;

  if (width < AppConstants.breakPointMobileTablet) {
    return width / 550;
  } else if (width < AppConstants.breakPointTabletLaptop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
