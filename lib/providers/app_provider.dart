import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String language_code = "en";
  void changeLanguageCode(String langCode){
    language_code = langCode;
    notifyListeners();
  }
}