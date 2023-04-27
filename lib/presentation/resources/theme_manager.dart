import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier{
  String currentTheme = "system";

  ThemeMode get themeMode{
    if(currentTheme == "light"){
      return ThemeMode.light;
    }else if(currentTheme == "dark"){
      return ThemeMode.dark;
    }else{
      return ThemeMode.light;
    }
  }

  changeTheme({required String theme})async{
    currentTheme = theme;
    notifyListeners();
  }
}