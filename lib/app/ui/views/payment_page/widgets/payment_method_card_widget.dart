import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

class PaymentMethodCardWidget extends StatefulWidget {
  const PaymentMethodCardWidget({
    super.key,
    required this.localization,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  final AppLocalizations localization;
  final int selectedMethod;
  final ValueChanged<int> onMethodChanged;

  @override
  State<PaymentMethodCardWidget> createState() => _PaymentMethodCardWidgetState();
}

class _PaymentMethodCardWidgetState extends State<PaymentMethodCardWidget> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ProjectUtility.elevatedWhiteCardBoxDecoration,
      padding: AppPadding.customLargeSmall,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.localization.paymentMethodTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _creditCardOption(context),
          const SizedBox(height: 8),
          _cashOnDeliveryOption(context),
        ],
      ),
    );
  }

  Widget _creditCardOption(BuildContext context) {
    final isSelected = widget.selectedMethod == 0;
    return Column(
      children: [
        InkWell(
          onTap: () => widget.onMethodChanged(0),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.orange.withValues(alpha: 0.05)
                  : Colors.grey.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColorConstants.primaryColor : Colors.grey.withValues(alpha: 0.3),
                width: isSelected ? 1.5 : 0.8,
              ),
            ),
            padding: AppPadding.allSmall,
            child: Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: isSelected ? AppColorConstants.primaryColor : Colors.grey[600],
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.localization.creditCardTitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                  ),
                ),
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: isSelected ? AppColorConstants.primaryColor : Colors.grey[600],
                ),
              ],
            ),
          ),
        ),
        if (isSelected) ...[
          const SizedBox(height: 8),
          _cardInputFields(context),
        ],
      ],
    );
  }

  Widget _cashOnDeliveryOption(BuildContext context) {
    final isSelected = widget.selectedMethod == 1;
    return InkWell(
      onTap: () => widget.onMethodChanged(1),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.orange.withValues(alpha: 0.05)
              : Colors.grey.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColorConstants.primaryColor : Colors.grey.withValues(alpha: 0.3),
            width: isSelected ? 1.5 : 0.8,
          ),
        ),
        padding: AppPadding.allSmall,
        child: Row(
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              color: isSelected ? AppColorConstants.primaryColor : Colors.grey[600],
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.localization.cashOnDeliveryTitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColorConstants.primaryColor : Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputField(
          context,
          label: widget.localization.cardNumberTitle,
          controller: _cardNumberController,
          hintText: '**** **** **** 1234',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(19),
            CardNumberInputFormatter(),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _inputField(
                context,
                label: widget.localization.expiryDateTitle,
                controller: _expiryController,
                hintText: 'AA/YY',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  ExpiryDateInputFormatter(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _inputField(
                context,
                label: widget.localization.cvvTitle,
                controller: _cvvController,
                hintText: '***',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _inputField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColorConstants.primaryColor, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length >= 2) {
      return TextEditingValue(
        text: '${text.substring(0, 2)}/${text.substring(2)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    }
    return newValue;
  }
}
