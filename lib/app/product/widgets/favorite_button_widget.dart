import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/color.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/data/entity/foods.dart';
import 'package:yemek_soyle_app/app/data/repo/favoritesdao_repository.dart';
import 'package:yemek_soyle_app/app/ui/cubit/favorites_page_cubit.dart';

class FavoriteButtonWidget extends StatefulWidget {
  FavoriteButtonWidget({
    Key? key,
    required this.food,
    required this.isFavoritePage,
  }) : super(key: key);

  final Foods food;
  bool isFavoritePage;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButtonWidget> {
  bool isFavorite = false;
  var favoriteRepository = FavoritesRepository();

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
    if (widget.isFavoritePage) {
      isFavorite = true;
    }
  }

  Future<void> _checkIfFavorite() async {
    bool result = await favoriteRepository.isFavoriteFood(widget.food.name);
    setState(() {
      isFavorite = result;
      if (isFavorite) {
        print("${widget.food.name} favori yemek");
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (isFavorite == false) {
        favoriteRepository.addToFavorites(widget.food);
      } else {
        favoriteRepository.removeFromFavorites(widget.food.name);
      }
      isFavorite = !isFavorite;
      //silindiğinde sayfa güncellemesi
      context.read<FavoritesPageCubit>().loadFavoriteFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: AppColor.primaryColor,
        size: IconSize.medium.value,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
