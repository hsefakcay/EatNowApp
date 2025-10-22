import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';

ThemeData get lightTheme {
  return ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorConstants.whiteColor,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColorConstants.primaryColor,
      foregroundColor: AppColorConstants.whiteColor,
      iconColor: AppColorConstants.whiteColor,
    )),
  );
}
