import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';

class OrderDetailsCardWidget extends StatelessWidget {
  const OrderDetailsCardWidget({
    super.key,
    required this.animation,
    required this.orderNumber,
    required this.totalAmount,
  });

  final Animation<double> animation;
  final String orderNumber;
  final int totalAmount;

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
                  context.localizedOrderDetailsTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                _buildDetailRow(
                  context,
                  context.localizedOrderNumberTitle,
                  orderNumber,
                  Icons.receipt_long,
                ),
                const SizedBox(height: 12),
                _buildDetailRow(
                  context,
                  context.localizedOrderTotalTitle,
                  '₺ ${totalAmount.toStringAsFixed(0)}',
                  Icons.attach_money,
                ),
                const SizedBox(height: 12),
                _buildDetailRow(
                  context,
                  context.localizedEstimatedDeliveryTime,
                  context.localizedDeliveryTimeMinutes,
                  Icons.access_time,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColorConstants.primaryColor,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColorConstants.primaryColor,
              ),
        ),
      ],
    );
  }
}
