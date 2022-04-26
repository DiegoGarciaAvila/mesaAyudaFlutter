import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.orange;

  final ThemeData light = ThemeData().copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.grey[300],
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primary)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primary)),
        helperStyle: TextStyle(
          color: primary,
        ),
        hintStyle: TextStyle(
          color: primary,
        ),
        labelStyle: TextStyle(color: primary),
        iconColor: primary,
      ),
      appBarTheme: const AppBarTheme(
        color: primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        elevation: 0,
      ),
        listTileTheme: ListTileThemeData(
        textColor: primary,
        iconColor: primary,
      ));
}
