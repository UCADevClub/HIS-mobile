import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:his_mobile/core/styles/theme/dimens/dimens.dart';
import 'package:his_mobile/presentation/application/application.dart';

extension ContextExtension on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  bool get isLight => Theme.of(this).brightness == Brightness.light;

  // Localization
  AppLocalizations get i10n => AppLocalizations.of(this)!;

  // Dimensions
  Dimens get dimens => Dimens();

  void setLocale(Locale locale) {
    HisMobile.of(this).setLocale(locale);
  }
}
