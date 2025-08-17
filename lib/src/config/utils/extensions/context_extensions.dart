import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext{
  double get screenWidth => MediaQuery.sizeOf(this).width;
  
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isInDarkMode => MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  TextTheme get textTheme => Theme.of(this).textTheme;

}