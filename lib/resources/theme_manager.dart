import 'package:flutter/material.dart';
import 'package:siansa_app/resources/color_manager.dart';
import 'package:siansa_app/resources/styles_manager.dart';
import 'package:siansa_app/resources/values_manager.dart';
import 'package:siansa_app/resources/font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // **************************************************
    // *** main colors of the app ***
    // **************************************************

    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // accentColor: ColorManager.grey, // accentColor is deprecated, the code below fixes it:
    // This code below fixes the deprecated 'accentColor' by using the 'colorScheme'
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey, // Use ColorManager.grey as secondary color
    ),
    // ripple color
    splashColor: ColorManager.primaryOpacity70,

    // **************************************************
    // *** card view theme ***
    // **************************************************

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // **************************************************
    // *** app bar theme ***
    // **************************************************

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    // **************************************************
    // *** button theme ***
    // **************************************************

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        // primary: ColorManager.primary, // 'primary' is depreacated, use 'backgroundColor' instead as shown in the next line:
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // **************************************************
    // *** text theme ***
    // **************************************************

    textTheme: TextTheme(
      // *
      // *
      // headline1: getSemiBoldStyle(
      //   color: ColorManager.darkGrey,
      //   fontSize: FontSize.s16,
      // ),
      // 'headline1' above is depreacated, use 'displayLarge' instead as show below:
      displayLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      // *
      // *
      // subtitle1: getMediumStyle(
      //   color: ColorManager.lightGrey,
      //   fontSize: FontSize.s14,
      // ),
      // 'subtitle1' above is depreacated, use 'titleMedium' instead as show below:
      titleMedium: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      // *
      // *
      // subtitle2: getMediumStyle(
      //   color: ColorManager.lightGrey,
      //   fontSize: FontSize.s14,
      // ),
      // 'subtitle2' above is depreacated, use 'titleSmall' instead as show below:
      titleSmall: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      // *
      // *
      // caption: getRegularStyle(color: ColorManager.grey1),
      // 'caption' above is depreacated, use 'bodySmall' instead as show below:
      bodySmall: getRegularStyle(color: ColorManager.grey1),
      // *
      // *
      // bodyText1: getRegularStyle(color: ColorManager.grey),
      // 'bodyText1' above is depreacated, use 'bodyLarge' instead as show below:
      bodyLarge: getRegularStyle(color: ColorManager.grey),
    ),

    // **************************************************
    // *** input decoration theme (text form field) ***
    // **************************************************

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      // label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),
      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
