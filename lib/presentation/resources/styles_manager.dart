import 'package:flutter/material.dart';

import 'font_manager.dart';

abstract class Styles {
  // styles with fontFamily1 = "Montserrat" ...
  static const textStyle14En1 = TextStyle(
    fontFamily: FontConstants.fontFamily1,
    fontSize: FontSize.s14,
    fontWeight: FontWeightManager.regular,
  );

  static const textStyle16En1 = TextStyle(
    fontFamily: FontConstants.fontFamily1,
    fontSize: FontSize.s16,
    fontWeight: FontWeightManager.regular,
  );
  static const textStyle18En1 = TextStyle(
    fontFamily: FontConstants.fontFamily1,
    fontSize: FontSize.s18,
    fontWeight: FontWeightManager.semiBold,
  );
  static const textStyle20En1 = TextStyle(
    fontFamily: FontConstants.fontFamily1,
    fontSize: FontSize.s20,
    fontWeight: FontWeightManager.regular,
  );

  static const textStyle30En1 = TextStyle(
    fontFamily: FontConstants.fontFamily1,
    fontSize: FontSize.s30,
    fontWeight: FontWeightManager.regular,
  );

  // styles with fontFamily2 = "CormorantInfant" ...
  static const textStyle14En2 = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontSize: FontSize.s14,
    fontWeight: FontWeightManager.regular,
  );

  static const textStyle16En2 = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontSize: FontSize.s16,
    fontWeight: FontWeightManager.regular,
  );
  static const textStyle18En2 = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontSize: FontSize.s18,
    fontWeight: FontWeightManager.semiBold,
  );
  static const textStyle20En2 = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontSize: FontSize.s20,
    fontWeight: FontWeightManager.regular,
  );

  static const textStyle30En2 = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontSize: FontSize.s30,
    fontWeight: FontWeightManager.bold,
  );

  static const textStyle30En2Italic = TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontSize: FontSize.s30,
      fontWeight: FontWeightManager.bold,
      fontStyle: FontStyle.italic);

// styles with fontFamily2 = fontFamilyAr = "Cairo" ...
  static const textStyle14Ar = TextStyle(
    fontFamily: FontConstants.fontFamilyAr,
    fontSize: FontSize.s14,
    fontWeight: FontWeightManager.regular,
  );

  static const textStyle16Ar = TextStyle(
    fontFamily: FontConstants.fontFamilyAr,
    fontSize: FontSize.s16,
    fontWeight: FontWeightManager.regular,
  );
  static const textStyle18Ar = TextStyle(
    fontFamily: FontConstants.fontFamilyAr,
    fontSize: FontSize.s18,
    fontWeight: FontWeightManager.semiBold,
  );
  static const textStyle20Ar = TextStyle(
    fontFamily: FontConstants.fontFamilyAr,
    fontSize: FontSize.s20,
    fontWeight: FontWeightManager.regular,
  );

  static const textStyle30Ar = TextStyle(
    fontFamily: FontConstants.fontFamilyAr,
    fontSize: FontSize.s30,
    fontWeight: FontWeightManager.regular,
  );
}
