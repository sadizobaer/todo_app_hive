import 'package:flutter/material.dart';

class AppTheme {
  static primaryTheme() {
    return ThemeData(
      primarySwatch: Colors.yellow,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.yellow.shade200,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ),
    );
  }
}
