import 'package:flutter/material.dart';

class AppTheme {
  // Main theme color
  static const primaryColor = Color(0xFF3A81F1);
  static const backgroundColor = Color(0xFFEDF3FF);

  // Card colors - different opacities of primary color
  static const cardBackgroundColor = Color(0xFFF5F9FF);
  static const cardIconColor = Color(0xFF3A81F1);

  static ThemeData get lightTheme => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      );
}
