import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/enums/themes.enum.dart';

class MyThemes{

  static final ThemeData light=ThemeData.light();
  static final ThemeData night=ThemeData.dark();
  static final ThemeData dark=ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
  );

  static ThemeData keyTheme(Keys obj){
    switch(obj){
      case Keys.LIGHT_MODE: return light;
      case Keys.NIGHT_MODE: return night;
      case Keys.DARK_MODE: return dark;
      default: return light;

    }
  }
}