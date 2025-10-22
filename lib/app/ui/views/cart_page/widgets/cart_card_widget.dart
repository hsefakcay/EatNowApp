import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/data/entity/cart_foods.dart';
import 'package:yemek_soyle_app/app/core/constants/app_strings.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

class CartCardWidget extends StatefulWidget {
  const CartCardWidget({
    super.key,
    required this.food,
  });

  final CartFoods food;

  @override
  State<CartCardWidget> createState() => _cartCardWidgetState();
}

class _cartCardWidgetState extends State<CartCardWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Dismissible(
      key: Key(widget.food.id.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        //sepetten yemek sil
        await context.read<CartPageCubit>().removeFromCart(widget.food);
        return true; // Dismiss işlemini onayla
      },
      background: Container(
        decoration: ProjectUtility.cartDismissibleBoxDecoration,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: AppPadding.rightLarge,
          child:
              Icon(Icons.delete, color: AppColorConstants.whiteColor, size: IconSize.large.value),
        ),
      ),
      child: Card(
        color: AppColorConstants.whiteColor,
        elevation: 3,
        child: Padding(
          padding: AppPadding.allxSmall,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _foodImage(context),
              Expanded(
                child: Padding(
                  padding: AppPadding.allxSmall,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _foodName(context),
                      _priceTitle(localizations, context),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: ScreenUtil.screenWidth(context) * AppStrings.cartControlsWidth,
                  child: _quantityControls(context)),
            ],
          ),
        ),
      ),
    );
  }

  Padding _foodImage(BuildContext context) {
    return Padding(
      padding: AppPadding.allSmall,
      child: Image.network(
        "${AppStrings.baseImageUrl}${widget.food.image}",
        width: ScreenUtil.screenWidth(context) * AppStrings.cartImageWidth,
      ),
    );
  }

  Text _priceTitle(AppLocalizations localizations, BuildContext context) {
    return Text("${AppStrings.currencySymbol} ${widget.food.price}",
        style: Theme.of(context).textTheme.titleMedium);
  }

  Text _foodName(BuildContext context) {
    return Text(
      widget.food.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
    );
  }

  Widget _quantityControls(BuildContext context) {
    final int quantity = int.tryParse(widget.food.orderQuantity) ?? 1;
    return Row(
      children: [
        _roundIconButton(
          context: context,
          icon: Icons.remove,
          background: Colors.black12,
          onTap: () => context.read<CartPageCubit>().updateCartQuantity(widget.food, quantity - 1),
        ),
        Padding(
          padding: AppPadding.allSmall,
          child: Text(
            quantity.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        _roundIconButton(
          context: context,
          icon: Icons.add,
          background: AppColorConstants.primaryColor,
          iconColor: AppColorConstants.whiteColor,
          onTap: () => context.read<CartPageCubit>().updateCartQuantity(widget.food, quantity + 1),
        ),
      ],
    );
  }

  Widget _roundIconButton({
    required BuildContext context,
    required IconData icon,
    required Color background,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: IconSize.medium.value,
        height: IconSize.large.value,
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor ?? Colors.black54),
      ),
    );
  }
}
