import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.black)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    listTileTheme:
        ListTileThemeData(iconColor: Colors.grey[300], textColor: Colors.black),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Color.fromARGB(255, 44, 44, 47),
      primary: Colors.white,
      secondary: Colors.grey[400] as Color,
    ));
