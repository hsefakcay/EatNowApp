// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:yemek_soyle_app/app/core/constants/color.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/data/entity/cart_foods.dart';
import 'package:yemek_soyle_app/app/data/entity/foods.dart';
import 'package:yemek_soyle_app/app/product/widgets/add_or_remove_button_widget.dart';
import 'package:yemek_soyle_app/app/product/widgets/detail_chip_widget.dart';
import 'package:yemek_soyle_app/app/product/widgets/favorite_button_widget.dart';
import 'package:yemek_soyle_app/app/product/widgets/food_image_widget.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:yemek_soyle_app/app/ui/views/cart_page/cart_view.dart';
import 'package:yemek_soyle_app/app/ui/views/detail_page/detail_view_mixin.dart';

class DetailView extends StatefulWidget {
  final Foods food; // Immutable olmalı

  const DetailView({
    required this.food,
    super.key,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> with DetailViewMixin {
  @override
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          localizations.productDetailTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: FavoriteButtonWidget(food: widget.food, isFavoritePage: false),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: ScreenUtil.screenHeight(context) * 0.05),
            _favoriteInfoRow(localizations),
            FoodImage(height: ScreenUtil.screenHeight(context), name: widget.food.image),
            _foodDetails(context),
            _orderQuantityRow(context),
            _detailChips(localizations),
            SizedBox(height: ScreenUtil.screenHeight(context) * 0.05),
            _totalPriceRow(ScreenUtil.screenWidth(context), ScreenUtil.screenHeight(context),
                localizations, context),
          ],
        ),
      ),
    );
  }

//siparişin toplam fiyatını gösteren text
  Row _totalPriceRow(
      double width, double height, AppLocalizations localizations, BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width * 0.5,
          child: Center(
            child: Text(
              //toplam tutar
              '₺ ${int.parse(widget.food.price) * orderQuantity}',
              //TODO: Use Theme.of(context).textTheme to provide the style dynamically
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _addToCartButton(height, width, localizations, context),
      ],
    );
  }

// Sipariş adedini değiştirme butonları
  Row _orderQuantityRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AddOrRemoveButtonWidget(onPressed: decrementOrderQuantity, buttonIcon: Icons.remove),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "$orderQuantity",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        AddOrRemoveButtonWidget(onPressed: incrementOrderQuantity, buttonIcon: Icons.add),
      ],
    );
  }

  SizedBox _addToCartButton(
      double height, double width, AppLocalizations localizations, BuildContext context) {
    return SizedBox(
      height: height * 0.08,
      width: width * 0.5,
      child: Expanded(
        child: ElevatedButton(
          child: Text(localizations.addToCart,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColor.whiteColor, fontWeight: FontWeight.bold)),
          onPressed: () {
            if (orderQuantity > 0) {
              //Sepete ekleme fonksiyonu ve sepet sayfasına gitme

              final cartItem = CartFoods(
                  id: widget.food.id,
                  ad: widget.food.name,
                  resim: widget.food.image,
                  fiyat: widget.food.price,
                  siparisAdet: orderQuantity.toString(),
                  kullaniciAdi: userName);
              context.read<CartPageCubit>().addToCart(cartItem);

              Navigator.push(
                context,
                MaterialPageRoute<CartView>(builder: (context) => const CartView()),
              );
            } else {
              _showSnackbar(context, localizations);
            }
          },
        ),
      ),
    );
  }

  // Snackbar gösterimi
  void _showSnackbar(BuildContext context, AppLocalizations localizations) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        localizations.snackBarTitleZeroOrder,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      behavior: SnackBarBehavior.fixed,
      duration: Durations.long4,
      backgroundColor: AppColor.primaryLightColor,
    ));
  }

  // Favori bilgisi gösterimi
  Row _favoriteInfoRow(AppLocalizations localizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.thumb_up, color: Colors.green, size: IconSize.normal.value),
        const SizedBox(width: 5),
        Text(
          "% 87 ${localizations.liked}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green),
        )
      ],
    );
  }

  // Ürün bilgileri gösterimi
  Column _foodDetails(BuildContext context) {
    return Column(
      children: [
        Text(widget.food.name,
            style:
                Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text('₺ ${widget.food.price}',
            style:
                Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Detay bilgilerini gösteren Chip'ler
  Row _detailChips(AppLocalizations localizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DetailChipWidget(text: localizations.deliveryTime),
        DetailChipWidget(text: localizations.freeDelivery),
        DetailChipWidget(text: localizations.discount),
      ],
    );
  }
}
