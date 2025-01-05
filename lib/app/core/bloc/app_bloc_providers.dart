import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_soyle_app/app/ui/cubit/home_cubit.dart';

//sadece başlangıçta ihtiyac olan bloc init ediliyor
class AppBlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
    ),
  ];
}
