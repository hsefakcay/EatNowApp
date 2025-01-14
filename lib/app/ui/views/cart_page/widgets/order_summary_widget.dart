// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';

import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/product/widgets/cart_text_button_widget.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    Key? key,
    required this.totalCoast,
  }) : super(key: key);

  final int totalCoast;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    var mHeight = ScreenUtil.screenHeight(context);

    return Container(
      height: mHeight * 0.25,
      decoration: ProjectUtility.cartBoxDecoration,
      alignment: Alignment.center,
      child: Padding(
        padding: AppPadding.customLargeSmall,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${localizations.shippingCost} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "₺ 0",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${localizations.total} :",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "₺$totalCoast",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: mHeight * 0.02),
            Container(
                decoration: ProjectUtility.primaryColorBoxDecoration,
                height: mHeight * 0.07,
                alignment: Alignment.center,
                child: CardTextButtonWidget(totalCoast: totalCoast))
          ],
        ),
      ),
    );
  }
}
