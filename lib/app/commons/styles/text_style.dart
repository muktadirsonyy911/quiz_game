import 'package:flutter/material.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';

class StyleText {
  // custom
  static TextStyle get size18BoldWhite => _textStyle(FontWeight.bold, 18, AppColors.whiteColor);
  static TextStyle get size18BolBlack => _textStyle(FontWeight.bold, 18, AppColors.blackColor);
  static TextStyle get size16BoldWhite => _textStyle(FontWeight.bold, 16, AppColors.whiteColor);
  static TextStyle get size16BoldBlack => _textStyle(FontWeight.bold, 16, AppColors.blackColor);
  static TextStyle get size20BoldWhite => _textStyle(FontWeight.bold, 20, AppColors.whiteColor);
  static TextStyle get size20BoldBlack => _textStyle(FontWeight.bold, 20, AppColors.blackColor);

  static TextStyle _textStyle(FontWeight weight, double size, Color color) =>
      TextStyle(fontSize: size, fontWeight: weight, decoration: TextDecoration.none, color: color);
}
