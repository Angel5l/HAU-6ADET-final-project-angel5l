import 'package:flutter/material.dart';

final scheme =
    ColorScheme.fromSeed(
      seedColor: const Color(0xFF000000), // your primary
      brightness: Brightness.light,
    ).copyWith(
      surface: const Color(0xFFFFFFFF), // surface
      onSurface: const Color(0xFF000000), // onSurface
    );

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
}

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x0ff00000)),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Playfair Display',
      fontSize: 15,
      fontWeight: FontWeight.normal,
      height: 1.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Spectral',
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.6,
    ),
  ),
  cardTheme: const CardThemeData(margin: EdgeInsets.all(8)),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
  ),
);
