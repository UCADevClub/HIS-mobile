import 'package:flutter/material.dart';

import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';

const appColorsLight = AppColorsLight();
const appColorsDark = AppColorsDark();

abstract class AppColors {
  const AppColors();

  Color get primaryColor;

  Color get secondaryColor;

  Color get white;

  Color get black;

  Color get grey;

  static AppColors of(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return appColorsLight;
      case Brightness.dark:
        return appColorsDark;
    }
  }
}
