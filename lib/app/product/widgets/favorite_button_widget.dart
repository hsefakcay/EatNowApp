import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/core/constants/app_strings.dart';
import 'package:yemek_soyle_app/app/data/entity/foods.dart';
import 'package:yemek_soyle_app/app/data/repo/favoritesdao_repository.dart';
import 'package:yemek_soyle_app/app/ui/cubit/favorites_page_cubit.dart';

class FavoriteButtonWidget extends StatefulWidget {
  FavoriteButtonWidget({
    Key? key,
    required this.food,
    required this.isFavoritePage,
    this.onFavoriteChanged,
  }) : super(key: key);

  final Foods food;
  bool isFavoritePage;
  final VoidCallback? onFavoriteChanged; // Favori durumu değiştiğinde çağrılacak callback

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
        print("${widget.food.name} ${AppStrings.favoriteFoodLog}");
      }
    });
  }

  void _toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    // Veritabanını güncelle
    if (isFavorite) {
      await favoriteRepository.addToFavorites(widget.food);
    } else {
      await favoriteRepository.removeFromFavorites(widget.food.name);
    }

    // Parent widget'a haber ver
    widget.onFavoriteChanged?.call();

    // FavoritesPageCubit mevcutsa onu da güncelle
    try {
      BlocProvider.of<FavoritesPageCubit>(context).loadFavoriteFoods();
    } catch (e) {
      // FavoritesPageCubit mevcut değilse sessizce devam et
      // Bu durum HomeView ve DetailView'da normal
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: AppColorConstants.primaryColor,
        size: IconSize.medium.value,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
