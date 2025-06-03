import 'package:flutter/material.dart';
import 'package:sample_project/app/themes/dark_theme.dart';
import 'package:sample_project/app/themes/light_theme.dart';

class AppTheme {
  static ThemeData getLightTheme() => lightTheme;
  static ThemeData getDarkTheme() => darkTheme;
}
