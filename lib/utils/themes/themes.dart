import 'package:flutter/material.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class CustomThemes {
  static double horizontalPadding = 24.0;

  static ThemeData mainTheme = ThemeData.light().copyWith(
    //Colors
    primaryColor: kPrimaryColor,

    //Scaffold
    scaffoldBackgroundColor: kGreyColorShade4,

    //AppBar
    appBarTheme: const AppBarTheme().copyWith(
      elevation: 0.0,
      color: kPrimaryColor,
    ),

    //Texts
    textTheme: const TextTheme().copyWith(
      headline1: headline1,
      headline2: headline2,
      headline3: headline3,
      headline4: headline4,
      headline5: headline5,
      headline6: headline6,
      bodyText1: paragraph5,
      bodyText2: paragraph5,
    ),

    //Buttons
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: kPrimaryColor,
    )),

    //TextFields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kWhiteColor,
      hintStyle: paragraph2.copyWith(color: kGreyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
  );
}
