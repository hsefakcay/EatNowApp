import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:yemek_soyle_app/services/error_service.dart';

abstract class AuthService {
  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthServiceImpl extends AuthService {
  final ErrorService _errorService = ErrorService();
  final Logger logger = Logger(); // Logger instance

  @override
  Future<bool> signUp({
    required String email,
    required String password,
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
      _errorService.handleAuthError(e);
      return false;
    } catch (e) {
      if (e is Exception) {
        _errorService.handleUnknownError(e);
      } else {
        // Diğer hata türleri için gerekli işlemler yapılabilir
        logger.e("Unknown error: $e");
      }
      return false;
    }
  }

  @override
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Successfully signed in
      return true;
    } on FirebaseAuthException catch (e) {
      _errorService.handleAuthError(e);
      return false;
    } catch (e) {
      if (e is Exception) {
        _errorService.handleUnknownError(e);
      } else {
        // Diğer hata türleri için gerekli işlemler yapılabilir
        logger.e("Unknown error: $e");
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
}
