import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:his_mobile/core/styles/theme/colors/app_colors.dart';
import 'package:his_mobile/core/styles/theme/dimens/dimens.dart';
import 'package:his_mobile/core/styles/theme/text/app_text_theme.dart';

final dimens = Dimens();

class AppTheme {
  static const _lightColors = appColorsLight;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightColors.primaryColor,
    colorScheme: ColorScheme.light(
      primary: _lightColors.primaryColor,
      secondary: _lightColors.secondaryColor,
      background: _lightColors.secondaryColor,
    ),
    fontFamily: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
    ).fontFamily,
    textTheme: AppTextTheme(
      colors: _lightColors,
      dimens: dimens,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return _lightColors.primaryColor;
        }
        return _lightColors.white;
      }),
      overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return _lightColors.white;
        }
        return _lightColors.primaryColor;
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColors.white,
      unselectedItemColor: _lightColors.grey,
      unselectedLabelStyle: TextStyle(
        color: _lightColors.grey,
        fontSize: dimens.headlineSmall,
      ),
    ),
  );

  static const _darkColors = appColorsDark;

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkColors.primaryColor,
    colorScheme: ColorScheme.dark(
      primary: _darkColors.primaryColor,
      secondary: _darkColors.secondaryColor,
      background: _darkColors.secondaryColor,
    ),
    fontFamily: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
    ).fontFamily,
    textTheme: AppTextTheme(
      colors: _darkColors,
      dimens: dimens,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return _lightColors.primaryColor;
        }
        return _lightColors.white;
      }),
      overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return _lightColors.white;
        }
        return _lightColors.primaryColor;
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColors.primaryColor,
      selectedItemColor: _lightColors.secondaryColor,
      unselectedItemColor: _lightColors.white,
    ),
  );
}
