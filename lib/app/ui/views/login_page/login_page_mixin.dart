import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/ui/views/login_page/login_view.dart';
import 'package:yemek_soyle_app/services/auth/auth_service.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

mixin LoginPageMixin on State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AppLocalizations localization() {
    final localizations = AppLocalizations.of(context)!;
    return localizations;
  }

  // sign in with firebase authentication
  Future<bool> signIn() async {
    {
      final success = await AuthServiceImpl().signIn(
        email: emailController.text,
        password: passwordController.text,
        localizations: localization(),
      );
      return success;
    }
  }
}
