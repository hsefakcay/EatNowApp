import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({
    super.key,
    required this.animation,
    required this.onContinueShopping,
    required this.onTrackOrder,
  });

  final Animation<double> animation;
  final VoidCallback onContinueShopping;
  final VoidCallback onTrackOrder;

  @override
  Widget build(BuildContext context) {
    final mHeight = ScreenUtil.screenHeight(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: mHeight * 0.06,
                child: ElevatedButton(
                  onPressed: onContinueShopping,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.localizedContinueShoppingTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColorConstants.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: mHeight * 0.06,
                child: OutlinedButton(
                  onPressed: onTrackOrder,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColorConstants.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.localizedTrackOrderTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColorConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
