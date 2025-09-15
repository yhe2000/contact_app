import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff29384D),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xffFFF1D4),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xffFFF1D4),
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff29384D),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(16),
        backgroundColor: const Color(0xffFFF1D4),
        foregroundColor: const Color(0xff29384D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        overlayColor: Colors.transparent,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xff29384D),
      border: OutlineInputBorder(
        gapPadding: 16,
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xffFFF1D4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xffFFF1D4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xffFFF1D4), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xffEE403D), width: 2),
      ),
      hintStyle: const TextStyle(
        color: Color(0xffE2F4F6),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xffFFF1D4),
    ),
  );
}
