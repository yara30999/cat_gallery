import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

abstract class Styles {
  static TextStyle style12Medium(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s12),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style14Medium(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style16Medium(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style18Medium(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
      fontWeight: FontWeightManager.medium,
    );
  }

  static TextStyle style18Bold(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
      fontWeight: FontWeightManager.bold,
    );
  }

  /*.................. used in 
  -login screen
  */
  static TextStyle style18semiBold(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
      fontWeight: FontWeightManager.semiBold,
      color: ColorManager.pink1,
    );
  }

  /*..................used in 
  -login divider
  */
  static TextStyle style20Regular(BuildContext context) {
    return TextStyle(
        fontFamily: FontConstants.fontMarhey,
        fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
        fontWeight: FontWeightManager.regular,
        color: ColorManager.grey);
  }

  /*..................used in 
  -login button
  -the two texts in login screen
  */
  static TextStyle style30Bold(BuildContext context) {
    return TextStyle(
        fontFamily: FontConstants.fontMarhey,
        fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
        fontWeight: FontWeightManager.bold,
        letterSpacing: 1.4);
  }

  static TextStyle style36Medium(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontMarhey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s36),
      fontWeight: FontWeightManager.medium,
    );
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
