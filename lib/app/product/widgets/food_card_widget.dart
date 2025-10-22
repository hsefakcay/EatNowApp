// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/data/entity/foods.dart';
import 'package:yemek_soyle_app/app/product/widgets/favorite_button_widget.dart';
import 'package:yemek_soyle_app/app/product/widgets/food_image_widget.dart';

class FoodCardWidget extends StatefulWidget {
  Foods food;
  bool isFavoritePage;
  VoidCallback? onFavoriteChanged;

  FoodCardWidget({
    required this.food,
    required this.isFavoritePage,
    this.onFavoriteChanged,
    super.key,
  });

  @override
  State<FoodCardWidget> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCardWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Card(
      elevation: 10,
      color: AppColorConstants.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              FoodImage(
                height: ScreenUtil.screenHeight(context) * 0.5,
                name: widget.food.image,
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: FavoriteButtonWidget(
                    food: widget.food,
                    isFavoritePage: widget.isFavoritePage,
                    onFavoriteChanged: widget.onFavoriteChanged,
                  )),
            ],
          ),
          Text(
            widget.food.name,
            // ignore: flutter_style_todos
            style: TextStyle(
              color: AppColorConstants.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.green,
                  size: IconSize.small.value,
                ),
              ),
              Text(
                //defalut atama
                '% 87 ${localizations.liked}',
                style: const TextStyle(color: Colors.green, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₺ ${widget.food.price}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColorConstants.blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.add_circle,
                    color: AppColorConstants.primaryColor,
                    size: IconSize.medium.value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
