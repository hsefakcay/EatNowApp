import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/ui/views/main_tab_page/main_tab_view.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/widgets/success_icon_widget.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/widgets/confirmation_title_widget.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/widgets/order_details_card_widget.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/widgets/order_status_card_widget.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/widgets/thank_you_message_widget.dart';
import 'package:yemek_soyle_app/app/ui/views/order_confirmation_page/widgets/action_buttons_widget.dart';

class OrderConfirmationView extends StatefulWidget {
  const OrderConfirmationView({
    super.key,
    required this.orderNumber,
    required this.totalAmount,
    this.orderItems = const [],
    this.cartCubit,
  });

  final String orderNumber;
  final int totalAmount;
  final List<Map<String, dynamic>> orderItems;
  final CartPageCubit? cartCubit;

  @override
  State<OrderConfirmationView> createState() => _OrderConfirmationViewState();
}

class _OrderConfirmationViewState extends State<OrderConfirmationView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _clearCart();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = ScreenUtil.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColorConstants.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontalRegular,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: mHeight * 0.08),
                      SuccessIconWidget(animation: _scaleAnimation),
                      SizedBox(height: mHeight * 0.04),
                      ConfirmationTitleWidget(animation: _fadeAnimation),
                      SizedBox(height: mHeight * 0.06),
                      OrderDetailsCardWidget(
                        animation: _fadeAnimation,
                        orderNumber: widget.orderNumber,
                        totalAmount: widget.totalAmount,
                      ),
                      SizedBox(height: mHeight * 0.04),
                      OrderStatusCardWidget(animation: _fadeAnimation),
                      SizedBox(height: mHeight * 0.04),
                      ThankYouMessageWidget(animation: _fadeAnimation),
                    ],
                  ),
                ),
              ),
              ActionButtonsWidget(
                animation: _fadeAnimation,
                onContinueShopping: _navigateToHome,
                onTrackOrder: _trackOrder,
              ),
              SizedBox(height: mHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (_) => const MainPage(),
      ),
      (route) => false,
    );
  }

  void _trackOrder() {
    // TODO: Implement order tracking functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sipariş takip özelliği yakında eklenecek!'),
        backgroundColor: AppColorConstants.successColor,
      ),
    );
  }

  void _clearCart() {
    // Clear cart using the passed cart cubit
    if (widget.cartCubit != null) {
      widget.cartCubit!.clearCart();
    } else {
      // Fallback: try to access cart cubit from context
      try {
        final cartCubit = context.read<CartPageCubit>();
        cartCubit.clearCart();
      } catch (e) {
        // If cart cubit is not available in context, ignore
        print('Cart cubit not available: $e');
      }
    }
  }
}
