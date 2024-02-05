import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension I10nExtention on BuildContext {
  AppLocalizations get i10n => AppLocalizations.of(this)!;
}
