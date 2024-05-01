import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/themes/text_them.dart';





// ThemeData myThemeData = ThemeData(
//   brightness: Brightness.light,
//   colorScheme: ColorScheme.light(
//    background: Color.fromARGB(255, 245, 207, 214),
//     primary: Color.fromARGB(255,249,10,127),
//     secondary: Color.fromARGB(255, 222, 8, 115),
//     tertiary: Color.fromARGB(255, 255, 232, 244),
//     inversePrimary: Color.fromARGB(255, 105, 180, 0),
//   ),
// );
ThemeData myThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
   background: Color.fromARGB(255, 245, 207, 214),
    primary: Color.fromARGB(255, 244, 10, 127),
    secondary:  Color.fromARGB(255, 249, 170, 209),
    tertiary: Color.fromARGB(255, 255, 232, 244),
    inversePrimary: Color.fromARGB(255, 255, 105, 180),
  ),
   textTheme: myTextTheme, // Define the default text color
  
);