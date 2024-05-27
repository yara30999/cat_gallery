import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

abstract class Styles {
  // styles with fontFamily1 = "Montserrat" ...
  static TextStyle textStyle14En1(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily1,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle16En1(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily1,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16),
      fontWeight: FontWeightManager.regular,
    );
  }

  /*.................. used in login screen*/
  static TextStyle textStyle18En1(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily1,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
      fontWeight: FontWeightManager.semiBold,
    );
  }

  static TextStyle textStyle20En1(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily1,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle30En1(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily1,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
      fontWeight: FontWeightManager.regular,
    );
  }

  // styles with fontFamily2 = "CormorantInfant" ...

  static TextStyle textStyle14En2(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle16En2(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle18En2(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
      fontWeight: FontWeightManager.semiBold,
    );
  }

/*..................used in 
  -login divider
  */
  static TextStyle textStyle20En2(BuildContext context) {
    return TextStyle(
        fontFamily: FontConstants.fontFamily2,
        fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
        fontWeight: FontWeightManager.bold,
        color: ColorManager.grey);
  }

  /*..................used in login form fields*/
  static TextStyle textStyle26En2(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s26),
      fontWeight: FontWeightManager.regular,
    );
  }

  /*..................used in 
  -login button
  -the two texts in login screen
  */
  static TextStyle textStyle30En2(BuildContext context) {
    return TextStyle(
        fontFamily: FontConstants.fontFamily2,
        fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
        fontWeight: FontWeightManager.bold,
        letterSpacing: 1.4);
  }

  static TextStyle textStyle34En2(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s34),
      fontWeight: FontWeightManager.bold,
    );
  }

  static TextStyle textStyle36En2(BuildContext context) {
    return TextStyle(
        fontFamily: FontConstants.fontFamily2,
        fontSize: getResponsiveFontSize(context, fontSize: FontSize.s36),
        fontWeight: FontWeightManager.bold,
        color: ColorManager.primary1);
  }

  static TextStyle textStyle30En2Italic(BuildContext context) {
    return TextStyle(
        fontFamily: FontConstants.fontFamily2,
        fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
        fontWeight: FontWeightManager.bold,
        fontStyle: FontStyle.italic);
  }

// styles with fontFamily2 = fontFamilyAr = "Cairo" ...
  static TextStyle textStyle14Ar(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamilyAr,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s14),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle16Ar(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamilyAr,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s16),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle18Ar(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamilyAr,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s18),
      fontWeight: FontWeightManager.semiBold,
    );
  }

  static TextStyle textStyle20Ar(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamilyAr,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s20),
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle textStyle30Ar(BuildContext context) {
    return TextStyle(
      fontFamily: FontConstants.fontFamilyAr,
      fontSize: getResponsiveFontSize(context, fontSize: FontSize.s30),
      fontWeight: FontWeightManager.regular,
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
  const baseMobileWidth = 800;
  const baseTabletWidth = 1200;
  if (width < baseMobileWidth) {
    return width / 550;
  } else if (width < baseTabletWidth) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
