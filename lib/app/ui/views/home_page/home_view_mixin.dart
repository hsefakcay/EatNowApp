import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/data/entity/foods.dart';
import 'package:yemek_soyle_app/app/ui/views/home_page/home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  AppLocalizations localization() {
    return AppLocalizations.of(context)!;
  }

  double getWidth() {
    return ScreenUtil.screenWidth(context);
  }

  void sortNameFood(List<Foods> yemeklerListesi, bool isDesc) {
    Comparator<Foods> sortName;
    if (isDesc == true) {
      sortName = (a, b) => a.name.compareTo(b.name);
    } else {
      sortName = (a, b) => b.name.compareTo(a.name);
    }
    yemeklerListesi.sort(sortName);
  }

  void sortCountFood(List<Foods> yemeklerListesi, bool isDesc) {
    Comparator<Foods> sortName;

    if (isDesc == true) {
      sortName = (a, b) => (int.parse(a.price)).compareTo(int.parse(b.price));
    } else {
      sortName = (a, b) => (int.parse(b.price)).compareTo(int.parse(a.price));
    }
    yemeklerListesi.sort(sortName);
  }

  void sortFoods(String? sortType, List<Foods> foodsList) {
    if (sortType != null) {
      setState(() {
        if (sortType == localization().sortByPriceAscending) {
          sortCountFood(foodsList, true);
        } else if (sortType == localization().sortByPriceDescending) {
          sortCountFood(foodsList, false);
        } else if (sortType == localization().sortByAlphabeticalAscending) {
          sortNameFood(foodsList, true);
        } else if (sortType == localization().sortByAlphabeticalDescending) {
          sortNameFood(foodsList, false);
        }
      });
    }
  }
}
