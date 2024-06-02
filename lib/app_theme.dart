import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color blackColor = Color(0xFF242424);
  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
                               backgroundColor: Colors.transparent,
                               iconTheme: IconThemeData(color: blackColor,),
                               elevation: 0),
                               textTheme: TextTheme(headline1: TextStyle(fontSize: 28,
                                                                         fontWeight: FontWeight.w700,
                                                                         color: blackColor  )
                                                    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: blackColor,unselectedItemColor: Colors.white)
                                                );
  static final ThemeData darkTheme = ThemeData();
}
