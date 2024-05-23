import 'package:flutter/material.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'color_manager.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    // main colors
    primaryColor: ColorManager.primary1,
    primaryColorLight: ColorManager.primary2,
    primaryColorDark: ColorManager.primary,
    disabledColor: ColorManager.primary3,

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s8,
      shadowColor: ColorManager.primary3,
      titleTextStyle: Styles.textStyle16En1,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.primary3,
        buttonColor: ColorManager.primary1,
        splashColor: ColorManager.grey),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.primary1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      textStyle: Styles.textStyle18En1,
    )),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      extendedTextStyle: Styles.textStyle18En1,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: Styles.textStyle14En1.copyWith(color: ColorManager.grey),
        labelStyle: Styles.textStyle14En1.copyWith(color: ColorManager.grey),
        errorStyle: Styles.textStyle14En1.copyWith(color: ColorManager.red),
        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.darkBrown, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.darkBrown, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.red, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.red, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    // main colors
    primaryColor: ColorManager.primary1,
    primaryColorLight: ColorManager.primary2,
    primaryColorDark: ColorManager.primary,
    disabledColor: ColorManager.primary3,

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.darkBrown,
      elevation: AppSize.s8,
      shadowColor: ColorManager.grey,
      titleTextStyle: Styles.textStyle16En1,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey,
        buttonColor: ColorManager.brown2,
        splashColor: ColorManager.grey),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.brown2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      textStyle: Styles.textStyle18En1,
    )),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      extendedTextStyle: Styles.textStyle18En1,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: Styles.textStyle14En1.copyWith(color: ColorManager.grey),
        labelStyle: Styles.textStyle14En1.copyWith(color: ColorManager.grey),
        errorStyle: Styles.textStyle14En1.copyWith(color: ColorManager.red),
        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.darkBrown, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.darkBrown, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.red, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.red, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
