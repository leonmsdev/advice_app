import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get tileBackgroundColor => brightness == Brightness.light
      ? const Color(0xffD5DBE0)
      : const Color(0xff171F2A);

  Color get accentBlue => const Color(0xff038FFE);

  Color get ligthGrey => brightness == Brightness.light
      ? const Color(0xffD5DBE0)
      : const Color(0xff657484);
}

class AppTheme {
  // ----------------- ligth theme -----------------
  static const Color _ligthPrimaryColor = Color(0xffBFB48F);
  static const Color _ligthAccentColor = Color(0xff904E55);

  static const TextStyle _ligthHeadingText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle _ligthBodyMedium = TextStyle(
    fontSize: 14,
  );

  static const TextTheme _ligthTextTheme = TextTheme(
    displayLarge: _ligthHeadingText,
    bodyMedium: _ligthBodyMedium,
  );

  static final ThemeData ligthTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: _ligthPrimaryColor,
    ),
    textTheme: _ligthTextTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      focusColor: _ligthAccentColor,
      backgroundColor: _ligthAccentColor,
    ),
  );

  // ----------------- dark theme ------------------
  static const Color _darkAppBarBackgroundColor = Color(0xff171C22);
  static const Color _darkMainBackgroundColor = Color(0xff0D1117);
  static const Color _darkGreenAccentColor = Color(0xff25913C);
  static const Color _darkBlueAccentColor = Color(0xff038FFE);
  static const Color _darkLigthGreyColor = Color(0xffD5DBE0);
  static const Color _darkWhiteColor = Color(0xffFEFEFF);

  static const TextStyle _darkHeadingText = TextStyle(
    fontSize: 20,
    color: _darkWhiteColor,
  );

  static const TextStyle _darkSmallText = TextStyle(
    fontSize: 16,
    color: _darkLigthGreyColor,
  );

  static const TextTheme _darkTextTheme = TextTheme(
    displaySmall: _darkHeadingText,
    bodySmall: _darkSmallText,
  );

  static const AppBarTheme _darkAppBarTheme = AppBarTheme(
    backgroundColor: _darkAppBarBackgroundColor,
    elevation: 0,
    toolbarTextStyle: TextStyle(
      color: _darkWhiteColor,
    ),
  );

  static const ProgressIndicatorThemeData _darkProgressIndicatorTheme =
      ProgressIndicatorThemeData(
    color: _darkGreenAccentColor,
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: _darkTextTheme,
    appBarTheme: _darkAppBarTheme,
    progressIndicatorTheme: _darkProgressIndicatorTheme,
    scaffoldBackgroundColor: _darkMainBackgroundColor,
    colorScheme: const ColorScheme.dark(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkBlueAccentColor,
    ),
  );
}
