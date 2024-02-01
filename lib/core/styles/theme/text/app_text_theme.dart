import 'package:flutter/material.dart';
import 'package:his_mobile/core/styles/theme/colors/app_colors.dart';
import 'package:his_mobile/core/styles/theme/dimens/dimens.dart';

class AppTextTheme extends TextTheme {
  final AppColors colors;
  final Dimens dimens;

  AppTextTheme({
    required this.colors,
    required this.dimens,
  }) : super(
          displayLarge: TextStyle(
            fontSize: dimens.textDisplayLarge,
            color: colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: dimens.textDisplayMedium,
            color: colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: dimens.textDisplaySmall,
            color: colors.black,
          ),
          headlineLarge: TextStyle(
            fontSize: dimens.headlineLarge,
            color: colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: dimens.headlineMedium,
            color: colors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: dimens.headlineSmall,
            color: colors.black,
          ),
        );
}
