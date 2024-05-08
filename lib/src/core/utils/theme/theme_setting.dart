import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static const Color primary = Color(0xff575fcf);
  static const Color secondary = Color(0xff1e272e);
  static const Color tertiary = Color(0xff1e272e);
  static const Color red = Color(0xffd63031);

  static const Color success = Color(0xff00b894);

  static ThemeData lightThemeEnglish = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      tertiary: tertiary,
      onTertiary: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: primary,
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: primary,
        background: Colors.black,
      ),
    ),
    fontFamily: "OpenSans",
  );

  static ThemeData lightThemeArabic = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      tertiary: tertiary,
      onTertiary: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: primary,
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: primary,
        background: Colors.black,
      ),
    ),
    fontFamily: "Cairo",
  );
}
