import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:yemek_soyle_app/app/core/constants/app_strings.dart';
import 'package:yemek_soyle_app/services/error/error_service.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

abstract class AuthService {
  Future<bool> signUp({
    required String email,
    required String password,
    AppLocalizations? localizations,
  });

  Future<bool> signIn({
    required String email,
    required String password,
    AppLocalizations? localizations,
  });

  Future<bool> signOut();

  // Kullanıcı oturum durumunu kontrol et
  bool isUserSignedIn();

  // Kullanıcı oturum durumunu stream olarak dinle
  Stream<User?> get authStateChanges;

  // Mevcut kullanıcıyı al
  User? get currentUser;
}

class AuthServiceImpl extends AuthService {
  final ErrorService _errorService = ErrorService();
  final Logger logger = Logger(); // Logger instance

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    AppLocalizations? localizations,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Successfully signed up
      // Call the onSignUpSuccess callback
      return true;
    } on FirebaseAuthException catch (e) {
      _errorService.handleAuthError(e, localizations: localizations);
      return false;
    } catch (e) {
      if (e is Exception) {
        _errorService.handleUnknownError(e, localizations: localizations);
      } else {
        // Diğer hata türleri için gerekli işlemler yapılabilir
        logger.e("${AppStrings.unknownErrorLog} $e");
      }
      return false;
    }
  }

  @override
  Future<bool> signIn({
    required String email,
    required String password,
    AppLocalizations? localizations,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Successfully signed in
      return true;
    } on FirebaseAuthException catch (e) {
      _errorService.handleAuthError(e, localizations: localizations);
      return false;
    } catch (e) {
      if (e is Exception) {
        _errorService.handleUnknownError(e, localizations: localizations);
      } else {
        // Diğer hata türleri için gerekli işlemler yapılabilir
        logger.e("${AppStrings.unknownErrorLog} $e");
      }
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    await FirebaseAuth.instance.signOut();
    //Successfully signed out
    return true;
  }

  @override
  bool isUserSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Stream<User?> get authStateChanges {
    return FirebaseAuth.instance.authStateChanges();
  }

  @override
  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }
}
