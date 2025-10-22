import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Extension for easier access to localization strings.
extension LocalizationExtension on BuildContext {
  String get localizedConfirmCart => AppLocalizations.of(this)!.confirmCart;
  String get localizedAppName => AppLocalizations.of(this)!.appName;
  String get localizedOrderPreparing => AppLocalizations.of(this)!.orderPreparing;

  // Order confirmation page strings
  String get localizedOrderConfirmedTitle => AppLocalizations.of(this)!.orderConfirmedTitle;
  String get localizedOrderConfirmedSubtitle => AppLocalizations.of(this)!.orderConfirmedSubtitle;
  String get localizedOrderNumberTitle => AppLocalizations.of(this)!.orderNumberTitle;
  String get localizedEstimatedDeliveryTime => AppLocalizations.of(this)!.estimatedDeliveryTime;
  String get localizedDeliveryTimeMinutes => AppLocalizations.of(this)!.deliveryTimeMinutes;
  String get localizedOrderDetailsTitle => AppLocalizations.of(this)!.orderDetailsTitle;
  String get localizedContinueShoppingTitle => AppLocalizations.of(this)!.continueShoppingTitle;
  String get localizedTrackOrderTitle => AppLocalizations.of(this)!.trackOrderTitle;
  String get localizedOrderStatusPreparing => AppLocalizations.of(this)!.orderStatusPreparing;
  String get localizedOrderStatusOnTheWay => AppLocalizations.of(this)!.orderStatusOnTheWay;
  String get localizedOrderStatusDelivered => AppLocalizations.of(this)!.orderStatusDelivered;
  String get localizedThankYouMessage => AppLocalizations.of(this)!.thankYouMessage;
  String get localizedOrderTotalTitle => AppLocalizations.of(this)!.orderTotalTitle;
}
