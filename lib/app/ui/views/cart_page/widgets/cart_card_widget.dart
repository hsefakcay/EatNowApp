import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/data/entity/cart_foods.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      onDismissed: (direction) {
        //sepetten yemek sil
        context.read<CartPageCubit>().removeFromCart(widget.food);
        context.read<CartPageCubit>().loadCartFoods();
      },
      background: Container(
        decoration: ProjectUtility.cartDismissibleBoxDecoration,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: AppPadding.rightLarge,
          child: Icon(Icons.delete, color: AppColor.whiteColor, size: IconSize.large.value),
        ),
      ),
      child: Card(
        color: AppColor.whiteColor,
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _foodImage(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _foodName(context),
                    _priceTitle(localizations, context),
                    _orderCountTitle(localizations, context),
                  ],
                ),
              ],
            ),
            Padding(
              padding: AppPadding.allRegular,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [_deleteCartFoodButton(context), _totalPriceTitle(context)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _totalPriceTitle(BuildContext context) {
    return Text(
      "₺${int.parse(widget.food.price) * int.parse(widget.food.orderQuantity)}",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Padding _foodImage(BuildContext context) {
    return Padding(
      padding: AppPadding.allRegular,
      child: Image.network(
        "http://kasimadalan.pe.hu/yemekler/resimler/${widget.food.image}",
        width: ScreenUtil.screenWidth(context) * 0.3,
      ),
    );
  }

  Text _orderCountTitle(AppLocalizations localizations, BuildContext context) {
    return Text("${localizations.count} ${widget.food.orderQuantity}",
        style: Theme.of(context).textTheme.titleMedium);
  }

  Text _priceTitle(AppLocalizations localizations, BuildContext context) {
    return Text("${localizations.price}₺ ${widget.food.price}",
        style: Theme.of(context).textTheme.titleMedium);
  }

  Text _foodName(BuildContext context) {
    return Text(widget.food.name,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900));
  }

  IconButton _deleteCartFoodButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<CartPageCubit>().removeFromCart(widget.food);
          context.read<CartPageCubit>().loadCartFoods();
        },
        icon: Icon(
          Icons.delete,
          size: IconSize.large.value,
          color: AppColor.primaryColor,
        ));
  }
}
