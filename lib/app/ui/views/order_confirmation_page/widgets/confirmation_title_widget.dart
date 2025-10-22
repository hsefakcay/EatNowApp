import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';

class ConfirmationTitleWidget extends StatelessWidget {
  const ConfirmationTitleWidget({
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
          child: Column(
            children: [
              Text(
                context.localizedOrderConfirmedTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColorConstants.primaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                context.localizedOrderConfirmedSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColorConstants.greyColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
