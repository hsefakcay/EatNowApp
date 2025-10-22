import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/product/language/localization_extension.dart';
import 'package:yemek_soyle_app/app/ui/views/payment_page/payment_view.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:yemek_soyle_app/services/notification/notification_service.dart';

class OrderButtonWidget extends StatefulWidget {
  const OrderButtonWidget({
    super.key,
    required this.totalCoast,
    this.cartItemCount = 0,
    this.buttonText,
    this.onPressed,
    this.isEnabled = true,
  });

  // The total cost of the items in the cart
  final int totalCoast;
  // The number of items in the cart
  final int cartItemCount;
  // Custom button text (if null, uses default based on context)
  final String? buttonText;
  // Custom onPressed callback (if null, uses default navigation)
  final VoidCallback? onPressed;
  // Whether the button is enabled
  final bool isEnabled;

  @override
  State<OrderButtonWidget> createState() => _OrderButtonWidgetState();
}

class _OrderButtonWidgetState extends State<OrderButtonWidget> with NotificationMixin {
  @override
  void initState() {
    super.initState();
    setupNotificationService();
  }

  @override
  Widget build(BuildContext context) {
    // Determine if button should be disabled
    final bool isDisabled =
        !widget.isEnabled || widget.cartItemCount <= 0 || widget.totalCoast <= 0;

    // Determine button text
    final String buttonText = widget.buttonText ?? context.localizedConfirmCart;

    final mHeight = ScreenUtil.screenHeight(context);

    return Container(
      height: mHeight * 0.07,
      width: double.infinity,
      decoration: ProjectUtility.primaryColorBoxDecoration,
      child: TextButton(
        onPressed: isDisabled ? null : _handleButtonPress,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDisabled ? AppColorConstants.lightgreyColor : AppColorConstants.whiteColor,
              ),
        ),
      ),
    );
  }

  void _handleButtonPress() {
    if (widget.onPressed != null) {
      // Use custom callback if provided
      widget.onPressed!();
    } else {
      // Default behavior: show notification and navigate to payment
      showCartNotification(
        context.localizedAppName,
        context.localizedOrderPreparing,
      );

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => BlocProvider<CartPageCubit>(
            create: (context) => CartPageCubit()..loadCartFoods(),
            child: PaymentView(totalCoast: widget.totalCoast),
          ),
        ),
      );
    }
  }
}

mixin NotificationMixin on State<OrderButtonWidget> {
  final NotificationService notificationService = NotificationService();

  void setupNotificationService() {
    notificationService.setup();
  }

  void showCartNotification(String title, String body) {
    notificationService.showNotification(title, body);
  }
}
