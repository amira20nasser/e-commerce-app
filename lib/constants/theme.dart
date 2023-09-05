import 'package:flutter/material.dart';

class ThemeManager {
  const ThemeManager._();
  static const ThemeManager shared = ThemeManager._();

  ThemeData getLightTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      );

  ThemeData getDarkTheme() => ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 183, 183, 183),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 161, 150, 100),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 13, 13, 14),
        ),
      );
}
