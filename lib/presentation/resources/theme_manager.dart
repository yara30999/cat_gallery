import 'package:flutter/material.dart';
import 'styles_manager.dart';
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
        surfaceTintColor: ColorManager.pink1,
        elevation: AppSize.s8),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary2,
      elevation: AppSize.s8,
      shadowColor: ColorManager.primary4,
      titleTextStyle:
          Styles.style36Medium().copyWith(color: ColorManager.white),
      toolbarTextStyle:
          Styles.style18Medium().copyWith(color: ColorManager.white),
    ),

    // radio theme
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return ColorManager.primary2; // Color when selected
        }
        return ColorManager.grey1; // Default color
      }),
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
        textStyle: Styles.style30Bold(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.brown1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      extendedTextStyle: Styles.style18Medium(),
    ),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      hintStyle: Styles.style18Medium(),
      errorStyle: Styles.style14Medium().copyWith(color: ColorManager.red),
      labelStyle: Styles.style18Medium().copyWith(color: ColorManager.primary1),
      // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary1, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary1, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
    ),

    //icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.white,
    ),

    //popup menu theme
    popupMenuTheme: PopupMenuThemeData(
      color: ColorManager.grey2,
      elevation: AppSize.s10,
      iconColor: ColorManager.primary4,
      textStyle: Styles.style18Bold().copyWith(color: ColorManager.primary2),
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
          Styles.style18Bold().copyWith(color: ColorManager.primary2)),
    ),

    //icon button
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconSize: WidgetStatePropertyAll(23)),
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
        color: ColorManager.grey1,
        shadowColor: ColorManager.orange1,
        surfaceTintColor: ColorManager.black,
        elevation: AppSize.s8),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.orange2,
      elevation: AppSize.s8,
      shadowColor: ColorManager.brown1,
      titleTextStyle:
          Styles.style36Medium().copyWith(color: ColorManager.white),
      toolbarTextStyle:
          Styles.style18Medium().copyWith(color: ColorManager.white),
    ),

    // radio theme
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return ColorManager.orange2; // Color when selected
        }
        return ColorManager.grey1; // Default color
      }),
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
        textStyle: Styles.style30Bold(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.brown1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      extendedTextStyle: Styles.style18Medium(),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      hintStyle: Styles.style18Medium(),
      errorStyle: Styles.style14Medium().copyWith(color: ColorManager.red),
      labelStyle: Styles.style18Medium().copyWith(color: ColorManager.orange3),
      // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.orange3, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.orange3, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s2),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
    ),

    //icon theme
    iconTheme: const IconThemeData(
      color: ColorManager.white,
    ),

    //popup menu theme
    popupMenuTheme: PopupMenuThemeData(
      color: ColorManager.grey3,
      elevation: AppSize.s10,
      iconColor: ColorManager.orange4,
      textStyle: Styles.style18Bold().copyWith(color: ColorManager.orange1),
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
          Styles.style18Bold().copyWith(color: ColorManager.orange1)),
    ),

    //icon button
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconSize: WidgetStatePropertyAll(23)),
    ),
  );
}
