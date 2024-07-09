import 'package:flutter/material.dart';
import 'values_manager.dart';
import 'color_manager.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // main colors
    primaryColor: ColorManager.primary2,
    primaryColorLight: ColorManager.primary3,
    primaryColorDark: ColorManager.primary1,
    disabledColor: ColorManager.pink3,
    scaffoldBackgroundColor: ColorManager.white,
    unselectedWidgetColor: ColorManager.grey2,
    // cardview theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.brown1,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary2,
      elevation: AppSize.s8,
      shadowColor: ColorManager.primary4,
      // titleTextStyle: Styles.textStyle16En1,
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.primary4,
        buttonColor: ColorManager.primary1,
        splashColor: ColorManager.brown1),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: ColorManager.white,
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
    inputDecorationTheme: const InputDecorationTheme(
      // content padding
      contentPadding: EdgeInsets.all(AppPadding.p16),
      hintStyle: TextStyle(color: ColorManager.grey1),
      labelStyle: TextStyle(color: ColorManager.primary1),
      errorStyle: TextStyle(color: ColorManager.red), // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary1, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary1, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // error border style
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
    ),

    //icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.white,
    ),

    //popup menu theme
    popupMenuTheme: const PopupMenuThemeData(
      color: ColorManager.grey2,
      elevation: AppSize.s10,
      iconColor: ColorManager.primary4,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // main colors
    primaryColor: ColorManager.orange2,
    primaryColorLight: ColorManager.orange4,
    primaryColorDark: ColorManager.orange3,
    disabledColor: ColorManager.green1,
    scaffoldBackgroundColor: ColorManager.black,
    unselectedWidgetColor: ColorManager.grey3,

    // cardview theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.brown1,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorManager.orange2,
      elevation: AppSize.s8,
      shadowColor: ColorManager.brown1,
      // titleTextStyle: Styles.textStyle16En1,
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.brown1,
        buttonColor: ColorManager.orange3,
        splashColor: ColorManager.brown1),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: ColorManager.white,
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
    inputDecorationTheme: const InputDecorationTheme(
      // content padding
      contentPadding: EdgeInsets.all(AppPadding.p16),
      hintStyle: TextStyle(color: ColorManager.grey1),
      labelStyle: TextStyle(color: ColorManager.orange3),
      errorStyle: TextStyle(color: ColorManager.red),
      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.orange3, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.orange3, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // error border style
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
    ),

    //icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.white,
    ),

    //popup menu theme
    popupMenuTheme: const PopupMenuThemeData(
      color: ColorManager.grey3,
      elevation: AppSize.s10,
      iconColor: ColorManager.orange4,
    ),
  );
}
