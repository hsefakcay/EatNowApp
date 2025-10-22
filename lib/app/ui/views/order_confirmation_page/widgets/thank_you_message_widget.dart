import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';

class ThankYouMessageWidget extends StatelessWidget {
  const ThankYouMessageWidget({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Container(
            padding: AppPadding.customLargeSmall,
            decoration: BoxDecoration(
              color: AppColorConstants.primaryLightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              context.localizedThankYouMessage,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColorConstants.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
