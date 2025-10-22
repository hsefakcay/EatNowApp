import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';

class ProjectUtility {
  static BoxDecoration cartBoxDecoration = BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topLeft, colors: [
    AppColorConstants.primaryColor,
    AppColorConstants.primaryLightColor,
    AppColorConstants.whiteColor
  ]));

  static BoxDecoration primaryColorBoxDecoration =
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColorConstants.primaryColor);

  static BoxDecoration signUpBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColorConstants.whiteColor,
      border: Border.all(width: 0.5, color: Colors.black45));

  // Modern white card with soft elevation used in payment sections
  static BoxDecoration elevatedWhiteCardBoxDecoration = BoxDecoration(
      color: AppColorConstants.whiteColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 0.6, color: Colors.black12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 20,
          offset: const Offset(0, 8),
        )
      ]);

  static BoxDecoration cartDismissibleBoxDecoration =
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColorConstants.redColor);

  static BoxDecoration lightColorBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: AppColorConstants.primaryLightColor);

  static BoxDecoration greyColorBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: AppColorConstants.lightgreyColor);
}
