// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';
import 'package:yemek_soyle_app/app/core/constants/app_constants.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';

import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/product/widgets/order_button_widget.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    Key? key,
    required this.totalCoast,
    this.cartItemCount = 0,
  }) : super(key: key);

  final int totalCoast;
  final int cartItemCount;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    var mHeight = ScreenUtil.screenHeight(context);

    final int deliveryFee = AppConstants.deliveryFee;
    final int subTotal = totalCoast;
    final int grandTotal = subTotal + deliveryFee;

    return Container(
      height: mHeight * 0.28,
      decoration: ProjectUtility.cartBoxDecoration,
      alignment: Alignment.center,
      child: Padding(
        padding: AppPadding.customLargeSmall,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _rowText(context, localizations.total, '₺ $subTotal'),
            _rowText(context, localizations.shippingCost.replaceAll(':', ''), '₺ $deliveryFee'),
            const Divider(),
            _rowText(
              context,
              localizations.total,
              '₺ $grandTotal',
              isEmphasis: true,
            ),
            SizedBox(height: mHeight * 0.02),
            OrderButtonWidget(
              totalCoast: grandTotal,
              cartItemCount: cartItemCount,
            ),
            SizedBox(height: mHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _rowText(BuildContext context, String left, String right, {bool isEmphasis = false}) {
    final leftStyle = isEmphasis
        ? Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context).textTheme.bodyLarge;
    final rightStyle = isEmphasis
        ? Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context).textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: leftStyle),
        Text(right, style: rightStyle),
      ],
    );
  }
}
