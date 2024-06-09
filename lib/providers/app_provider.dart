import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String language_code = "en";
  ThemeMode themeMode = ThemeMode.light;
  void changeLanguageCode(String langCode){
    language_code = langCode;
    notifyListeners();
  }
  void changeThemeMode(ThemeMode themeMode){
    this.themeMode = themeMode;
    notifyListeners();
  }
}