import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF000000),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFFFFFF),
      background: Color(0xFFF0F0F7),
      onPrimary: Color(0xFF979797),
      outline: Color(0xFFD2D2D2),
      inversePrimary: Color(0xFF000000),
      onBackground: Color(0xFF808080),
    ),
    highlightColor: const Color(0xFFF83333),
    indicatorColor: const Color(0xFFB80909));

ThemeData darkMode = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.dark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF000000),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF181818),
      background: Color(0xFF100E0E),
      onPrimary: Color(0xFF848484),
      outline: Color(0xFF292929),
      inversePrimary: Color(0xFFF0F0F7),
      onBackground: Color(0xFF989898),
    ),
    focusColor: const Color(0xFFF2F1F6),
    highlightColor: const Color(0xFFF83333),
    indicatorColor: const Color(0xFFB80909));
