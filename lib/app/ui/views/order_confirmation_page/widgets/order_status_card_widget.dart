import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';

class OrderStatusCardWidget extends StatelessWidget {
  const OrderStatusCardWidget({
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
            decoration: ProjectUtility.elevatedWhiteCardBoxDecoration,
            padding: AppPadding.customLargeSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sipariş Durumu',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                _buildStatusStep(
                  context,
                  context.localizedOrderStatusPreparing,
                  true,
                  Icons.restaurant,
                ),
                _buildStatusConnector(),
                _buildStatusStep(
                  context,
                  context.localizedOrderStatusOnTheWay,
                  false,
                  Icons.delivery_dining,
                ),
                _buildStatusConnector(),
                _buildStatusStep(
                  context,
                  context.localizedOrderStatusDelivered,
                  false,
                  Icons.check_circle_outline,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusStep(
    BuildContext context,
    String title,
    bool isActive,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: isActive ? AppColorConstants.primaryColor : AppColorConstants.lightgreyColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isActive ? AppColorConstants.whiteColor : AppColorConstants.greyColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isActive ? AppColorConstants.primaryColor : AppColorConstants.greyColor,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
        ),
      ],
    );
  }

  Widget _buildStatusConnector() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
      child: Container(
        height: 20,
        width: 2,
        color: AppColorConstants.lightgreyColor,
      ),
    );
  }
}
