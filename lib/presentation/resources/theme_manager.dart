import 'package:flutter/material.dart';
import 'values_manager.dart';
import 'color_manager.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    // main colors
    primaryColor: ColorManager.primary2,
    primaryColorLight: ColorManager.primary3,
    primaryColorDark: ColorManager.primary1,
    disabledColor: ColorManager.primary4,

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.brown1,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary1,
      elevation: AppSize.s8,
      shadowColor: ColorManager.primary4,
      // titleTextStyle: Styles.textStyle16En1,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.primary4,
        buttonColor: ColorManager.primary2,
        splashColor: ColorManager.brown1),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.primary2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      // textStyle: Styles.textStyle18En1,
    )),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.brown1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      // extendedTextStyle: Styles.textStyle18En1,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        // hintStyle: Styles.textStyle14En1.copyWith(color: ColorManager.brown1),
        // labelStyle: Styles.textStyle14En1.copyWith(color: ColorManager.brown1),
        // errorStyle: Styles.textStyle14En1.copyWith(color: ColorManager.red),
        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.orange1, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.orange1, width: AppSize.s1_5),
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
    primaryColor: ColorManager.primary2,
    primaryColorLight: ColorManager.primary3,
    primaryColorDark: ColorManager.primary1,
    disabledColor: ColorManager.primary4,

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.brown1,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.orange1,
      elevation: AppSize.s8,
      shadowColor: ColorManager.brown1,
      // titleTextStyle: Styles.textStyle16En1,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.brown1,
        buttonColor: ColorManager.orange3,
        splashColor: ColorManager.brown1),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.orange3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      // textStyle: Styles.textStyle18En1,
    )),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.brown1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      // extendedTextStyle: Styles.textStyle18En1,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        // hintStyle: Styles.textStyle14En1.copyWith(color: ColorManager.brown1),
        // labelStyle: Styles.textStyle14En1.copyWith(color: ColorManager.brown1),
        // errorStyle: Styles.textStyle14En1.copyWith(color: ColorManager.red),
        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.orange1, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.orange1, width: AppSize.s1_5),
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
