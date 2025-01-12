import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:yemek_soyle_app/app/ui/cubit/favorites_page_cubit.dart';
import 'package:yemek_soyle_app/app/ui/cubit/home_cubit.dart';

//sadece başlangıçta ihtiyac olan bloc init ediliyor
class AppBlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
    ),
    BlocProvider<CartPageCubit>(
      create: (context) => CartPageCubit(),
    ),
    BlocProvider<FavoritesPageCubit>(
      create: (context) => FavoritesPageCubit(),
    ),
  ];
}
