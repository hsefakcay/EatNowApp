import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

import 'package:yemek_soyle_app/app/ui/views/cart_page/cart_view.dart';

mixin CarPageMixin on State<CartView> {
  AppLocalizations localization() {
    return AppLocalizations.of(context)!;
  }
}
