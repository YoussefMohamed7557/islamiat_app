import 'package:flutter/material.dart';
import 'package:islamiat/app_theme.dart';
import 'package:islamiat/home_screen.dart';
import 'package:islamiat/surah_details.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName : (context)=> HomeScreen(),
        SurahDetails.routeName : (context) => SurahDetails()
      },
      theme: AppTheme.lightTheme,
    );
  }
}
