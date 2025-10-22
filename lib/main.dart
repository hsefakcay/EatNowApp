import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yemek_soyle_app/app/core/theme/light_theme.dart';
import 'package:yemek_soyle_app/app/product/initialize/application_start.dart';
import 'package:yemek_soyle_app/app/ui/views/auth_guard/auth_guard_widget.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

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
    return MaterialApp(
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
      home: const AuthGuardWidget(),
    );
  }
}
