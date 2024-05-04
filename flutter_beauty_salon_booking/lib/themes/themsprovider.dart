import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/themes/darkmode.dart';
class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = ThemeData.light();
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkmode;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == ThemeData.light()){
      themeData = darkmode;
    }
    else{
      themeData = ThemeData.light();
    }
  }
}