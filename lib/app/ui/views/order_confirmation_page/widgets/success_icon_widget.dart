import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';

class SuccessIconWidget extends StatelessWidget {
  const SuccessIconWidget({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final mHeight = ScreenUtil.screenHeight(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: Container(
            height: mHeight * 0.15,
            width: mHeight * 0.15,
            decoration: BoxDecoration(
              color: AppColorConstants.successLightColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              size: mHeight * 0.08,
              color: AppColorConstants.successColor,
            ),
          ),
        );
      },
    );
  }
}
