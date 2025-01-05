import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/core/constants/color.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';
import 'package:yemek_soyle_app/app/product/widgets/cart_alert_dialog_widget.dart';
import 'package:yemek_soyle_app/services/notification_service.dart';

class CardTextButtonWidget extends StatefulWidget {
  CardTextButtonWidget({
    super.key,
    required this.totalCoast,
  });
  // The total cost of the items in the cart.
  final int totalCoast;

  @override
  State<CardTextButtonWidget> createState() => _CardTextButtonWidgetState();
}

class _CardTextButtonWidgetState extends State<CardTextButtonWidget> with NotificationMixin {
  @override
  void initState() {
    super.initState();
    setupNotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        context.localizedConfirmCart,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold, color: AppColor.whiteColor),
      ),
      onPressed: () {
        if (widget.totalCoast <= 0) return;

        showCartNotification(context.localizedAppName, context.localizedOrderPreparing);

        showDialog<CartDialog>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return CartDialog(context: context);
          },
        );
      },
    );
  }
}

mixin NotificationMixin on State<CardTextButtonWidget> {
  final NotificationService notificationService = NotificationService();

  void setupNotificationService() {
    notificationService.setup();
  }

  void showCartNotification(String title, String body) {
    notificationService.showNotification(title, body);
  }
}
