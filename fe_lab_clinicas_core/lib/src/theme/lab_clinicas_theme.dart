import 'package:flutter/material.dart';

final class LabClinicasTheme {
  static const orangeColor = Color(0xFFFFAE45);
  static const ligthOrangeColor = Color(0xFFFFEFE9);
  static const blueColor = Color(0xFF01BDD6);
  static const ligthGrayColor = Color(0xFFFFEFE9);

  static final _defaultInputerBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: ligthOrangeColor),
  );

  static final lightThem = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ligthOrangeColor),
    useMaterial3: true,
    scaffoldBackgroundColor: ligthOrangeColor,
    fontFamily: 'Montserrat',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ligthOrangeColor,
      labelStyle: const TextStyle(
        fontSize: 14,
        color: orangeColor,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle:
          const TextStyle(color: blueColor, fontWeight: FontWeight.w600),
      border: _defaultInputerBorder,
      enabledBorder: _defaultInputerBorder,
      focusedBorder: _defaultInputerBorder,
      errorBorder: _defaultInputerBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: blueColor),
          foregroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
  static final darkTheme = lightThem;
  static const titleStyle =
      TextStyle(color: blueColor, fontSize: 32, fontWeight: FontWeight.w900);

  static const titleSmallStyle =
      TextStyle(color: blueColor, fontSize: 24, fontWeight: FontWeight.w900);

  static const subTitleSmallStyle =
      TextStyle(color: blueColor, fontSize: 18, fontWeight: FontWeight.w500);
}
