import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yemek_soyle_app/app/ui/views/login_page/login_view.dart';
import 'package:yemek_soyle_app/app/ui/views/main_tab_page/main_tab_view.dart';
import 'package:yemek_soyle_app/app/ui/views/splash_page/splash_view.dart';

class AuthGuardWidget extends StatefulWidget {
  const AuthGuardWidget({super.key});

  @override
  State<AuthGuardWidget> createState() => _AuthGuardWidgetState();
}

class _AuthGuardWidgetState extends State<AuthGuardWidget> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // 2 saniye sonra splash'i kapat
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return const SplashView();
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Kullanıcı giriş yapmışsa ana sayfaya yönlendir
        if (snapshot.hasData && snapshot.data != null) {
          return MainPage();
        }

        // Kullanıcı giriş yapmamışsa login sayfasına yönlendir
        return LoginView();
      },
    );
  }
}
