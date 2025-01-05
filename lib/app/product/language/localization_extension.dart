import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Extension for easier access to localization strings.
extension LocalizationExtension on BuildContext {
  String get localizedConfirmCart => AppLocalizations.of(this)!.confirmCart;
  String get localizedAppName => AppLocalizations.of(this)!.appName;
  String get localizedOrderPreparing => AppLocalizations.of(this)!.orderPreparing;
}
 