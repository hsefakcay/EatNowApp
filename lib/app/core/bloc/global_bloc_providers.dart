import 'package:flutter_bloc/flutter_bloc.dart';

/// Global olarak uygulama genelinde kullanılan bloc provider'ları
/// Bu bloc'lar tüm uygulama boyunca yaşar ve her sayfada erişilebilir
class GlobalBlocProviders {
  /// Global olarak gerekli olan bloc'lar
  /// Authentication, theme, language, notification gibi global state'ler buraya eklenir
  static final List<BlocProvider> providers = [
    // Şu an için global bloc yok
    // Gelecekte aşağıdaki gibi global bloc'lar eklenebilir:

    // BlocProvider<AuthCubit>(
    //   create: (context) => AuthCubit(),
    // ),

    // BlocProvider<ThemeCubit>(
    //   create: (context) => ThemeCubit(),
    // ),

    // BlocProvider<NotificationCubit>(
    //   create: (context) => NotificationCubit(),
    // ),
  ];

  /// Global bloc'ları kontrol etmek için yardımcı method
  static bool hasGlobalBlocs() {
    return providers.isNotEmpty;
  }

  /// Global bloc sayısını döndürür
  static int get globalBlocCount => providers.length;
}
