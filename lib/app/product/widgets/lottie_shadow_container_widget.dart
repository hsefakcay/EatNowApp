import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yemek_soyle_app/app/core/constants/app_strings.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';

class LottieShadowContainerWidget extends StatelessWidget {
  const LottieShadowContainerWidget({
    super.key,
    this.height = 200,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColorConstants.primaryLightColor,
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.shade500, // Gölge rengi ve şeffaflık
            spreadRadius: AppStrings.shadowSpreadRadius, // Gölgenin yayılma yarıçapı
            blurRadius: AppStrings.shadowBlurRadius, // Gölgenin bulanıklık yarıçapı
          ),
        ],
      ),
      child: ClipOval(child: Lottie.asset(AppStrings.lottieAnimationPath, fit: BoxFit.cover)),
    );
  }
}
