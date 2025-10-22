import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';
import 'package:yemek_soyle_app/app/core/constants/icon_sizes.dart';
import 'package:yemek_soyle_app/app/core/utils/screen_utility.dart';
import 'package:yemek_soyle_app/app/ui/views/main_tab_page/main_tab_mixin.dart';
import 'package:yemek_soyle_app/app/product/widgets/floating_actions_button.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';

class MainPage extends StatefulWidget {
  final int currentIndex;

  const MainPage({super.key, this.currentIndex = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainTabMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartPageCubit(),
      child: Scaffold(
          body: pages[currentIndex],
          extendBody: true,
          floatingActionButton: MainFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: _bottomAppBar(context, notchValue)),
    );
  }

  //BottomNavigationBar widget
  BottomAppBar _bottomAppBar(BuildContext context, double notchValue) {
    return BottomAppBar(
      color: AppColorConstants.whiteColor,
      surfaceTintColor: AppColorConstants.primaryColor,
      height: ScreenUtil.screenHeight(context) * 0.055,
      padding: const EdgeInsets.only(top: 10),
      shape: const CircularNotchedRectangle(),
      notchMargin: notchValue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _homeButton(),
          _favoriteButton(),
          _profileButton(),
          const SizedBox(width: 0),
        ],
      ),
    );
  }

  IconButton _profileButton() {
    return IconButton(
      icon: Icon(
        currentIndex == 2 ? Icons.person : Icons.person_outline_rounded,
        size: IconSize.medium.value,
        color: AppColorConstants.primaryColor,
      ),
      onPressed: () {
        onTabTapped(2);
      },
    );
  }

  IconButton _favoriteButton() {
    return IconButton(
      icon: Icon(
        currentIndex == 1 ? Icons.favorite : Icons.favorite_outline_rounded,
        size: IconSize.medium.value,
        color: AppColorConstants.primaryColor,
      ),
      onPressed: () {
        onTabTapped(1);
      },
    );
  }

  IconButton _homeButton() {
    return IconButton(
        icon: Icon(
          currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
          size: IconSize.medium.value,
          color: AppColorConstants.primaryColor,
        ),
        onPressed: () {
          onTabTapped(0);
        });
  }
}
