import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/ui/cubit/cart_page_cubit.dart';
import 'package:yemek_soyle_app/app/ui/cubit/favorites_page_cubit.dart';
import 'package:yemek_soyle_app/app/ui/cubit/home_cubit.dart';

/// Global olarak gerekli olan bloc provider'ları
/// Sadece uygulama genelinde kullanılan state'ler burada tanımlanmalı
class AppBlocProviders {
  /// Global olarak gerekli olan bloc'lar (şu an için boş)
  /// Authentication, theme, language gibi global state'ler buraya eklenebilir
  static final List<BlocProvider> globalProviders = [
    // Şu an için global bloc yok
    // Gelecekte authentication, theme gibi global state'ler eklenebilir
  ];

  /// Sayfa bazlı bloc provider'ları - Lazy loading ile
  /// Her sayfa sadece kendi ihtiyacı olan bloc'u init eder

  /// Home sayfası için bloc provider
  static BlocProvider<HomeCubit> get homeProvider => BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
      );

  /// Cart sayfası için bloc provider
  static BlocProvider<CartPageCubit> get cartProvider => BlocProvider<CartPageCubit>(
        create: (context) => CartPageCubit(),
      );

  /// Favorites sayfası için bloc provider
  static BlocProvider<FavoritesPageCubit> get favoritesProvider => BlocProvider<FavoritesPageCubit>(
        create: (context) => FavoritesPageCubit(),
      );

  
}
