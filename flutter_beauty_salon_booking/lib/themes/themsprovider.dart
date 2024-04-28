import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/themes/darkmode.dart';
import 'package:flutter_beauty_salon_booking/themes/lightmode.dart';

// class ThemeProvider with ChangeNotifier{
//   ThemeData _themeData = lightmode;
//   ThemeData get themeData => _themeData;
//   bool get isDarkMode => _themeData == darkmode;
//   set themeData(ThemeData themeData){
//     _themeData = themeData;
//     notifyListeners();
//   }
//   void toggleTheme(){
//     if(_themeData == lightmode){
//       themeData = darkmode;
//     }
//     else{
//       themeData = lightmode;
//     }
//   }
// }