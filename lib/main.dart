import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yemek_soyle_app/app/core/bloc/app_bloc_providers.dart';
import 'package:yemek_soyle_app/app/core/theme/light_theme.dart';
import 'package:yemek_soyle_app/app/product/initialize/application_start.dart';
import 'package:yemek_soyle_app/app/ui/views/login_page/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        title: AppLocalizations.of(context)?.appName ?? "",
        theme: lightTheme,
        home: LoginView(),
      ),
    );
  }
}
