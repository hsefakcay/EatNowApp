import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/ui/views/sign_up_page/signup_view.dart';
import 'package:yemek_soyle_app/services/auth/auth_service.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

mixin SignUpPageMixin on State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AppLocalizations localization() {
    final localizations = AppLocalizations.of(context)!;
    return localizations;
  }

  // sign up with firebase authentication
  Future<bool> signUp() async {
    {
      final success = await AuthServiceImpl().signUp(
        email: emailController.text,
        password: passwordController.text,
        localizations: localization(),
      );
      return success;
    }
  }
}
