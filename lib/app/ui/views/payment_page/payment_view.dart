import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/app_constants.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/ui/views/payment_page/widgets/payment_method_card_widget.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';
import 'package:yemek_soyle_app/app/product/widgets/order_button_widget.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/order_confirmation_view.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key, required this.totalCoast});

  final int totalCoast;

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  AppLocalizations localization() {
    return AppLocalizations.of(context)!;
  }

  int _methodIndex = 0; // 0: card, 1: cash

  @override
  Widget build(BuildContext context) {
    final deliveryFee = AppConstants.deliveryFee;
    final subTotal = widget.totalCoast - deliveryFee;
    final grandTotal = widget.totalCoast;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localization().paymentTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColorConstants.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: AppPadding.horizontalRegular,
                child: Column(
                  children: [
                    Padding(
                      padding: AppPadding.bottomMedium,
                      child: _addressCard(context),
                    ),
                    Padding(
                      padding: AppPadding.bottomMedium,
                      child: PaymentMethodCardWidget(
                        localization: localization(),
                        selectedMethod: _methodIndex,
                        onMethodChanged: (index) => setState(() => _methodIndex = index),
                      ),
                    ),
                    _summaryCard(context, subTotal, deliveryFee, grandTotal),
                  ],
                ),
              ),
            ),
            Padding(
              padding: AppPadding.customLargeSmall,
              child: OrderButtonWidget(
                totalCoast: widget.totalCoast,
                cartItemCount: 1, // Payment sayfasında zaten sepet dolu
                buttonText: localization().completeOrderTitle,
                onPressed: () {
                  _completeOrder();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardContainer({required Widget child}) {
    return Container(
      decoration: ProjectUtility.elevatedWhiteCardBoxDecoration,
      padding: AppPadding.customLargeSmall,
      child: child,
    );
  }

  Widget _addressCard(BuildContext context) {
    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(localization().deliveryAddressTitle,
                  style: Theme.of(context).textTheme.titleMedium),
              Text(localization().changeTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColorConstants.primaryColor)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.home, color: Colors.orange),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ev Adresim', style: Theme.of(context).textTheme.titleSmall),
                    Text(
                      '1234 Örnek Sokak, Harika Mah. No: 5, Güzelce / İstanbul',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _summaryCard(BuildContext context, int subTotal, int deliveryFee, int grandTotal) {
    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(localization().orderSummaryTitle,
              style:
                  Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          _rowText(context, localization().subtotalTitle, '₺ ${subTotal.toStringAsFixed(0)}'),
          _rowText(context, localization().shippingCost.replaceAll(':', ''),
              '₺ ${deliveryFee.toStringAsFixed(0)}'),
          const Divider(height: 24),
          _rowText(context, localization().total, '₺ ${grandTotal.toStringAsFixed(0)}',
              isEmphasis: true),
        ],
      ),
    );
  }

  Widget _rowText(BuildContext context, String left, String right, {bool isEmphasis = false}) {
    final leftStyle = isEmphasis
        ? Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context).textTheme.bodyLarge;
    final rightStyle = isEmphasis
        ? Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context).textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: leftStyle),
        Text(right, style: rightStyle),
      ],
    );
  }

  void _completeOrder() {
    // Generate a random order number
    final orderNumber = 'YS${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';

    // Get cart cubit to pass to order confirmation
    final cartCubit = context.read<CartPageCubit>();

    // Navigate to order confirmation page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => OrderConfirmationView(
          orderNumber: orderNumber,
          totalAmount: widget.totalCoast,
          orderItems: [], // TODO: Pass actual order items
          cartCubit: cartCubit,
        ),
      ),
    );
  }
}
