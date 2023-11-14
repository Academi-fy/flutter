import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    fontFamily: "Manrope",
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF000000),
    ),
    colorScheme: const ColorScheme.light(
      background: Color(0xFFFFFFFF),
      primary: Color(0xFFF2F1F6),
      onPrimary: Color(0xFF808080),
      outline: Color(0xFFD2D2D2),
      inversePrimary: Color(0xFF000000),
      onBackground: Color(0xFF979797),
    ),
    highlightColor: const Color(0xFFE45C5C),
    indicatorColor: const Color(0xFFE01717));

ThemeData darkMode = ThemeData(
    fontFamily: "Manrope",
    brightness: Brightness.dark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFFF2F1F6),
    ),
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF000000),
      primary: Color(0xFF141414),
      onPrimary: Color(0xFF807F87),
      outline: Color(0xFF222222),
      inversePrimary: Color(0xFFFFFFFF),
      onBackground: Color(0xFF464646),
    ),
    focusColor: const Color(0xFFF2F1F6),
    highlightColor: const Color(0xFFE45C5C),
    indicatorColor: const Color(0xFFE01717));
