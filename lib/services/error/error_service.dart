import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:yemek_soyle_app/app/core/utils/toast_helper.dart';
import 'package:yemek_soyle_app/app/assets/l10n/app_localizations.dart';

class ErrorService {
  final Logger logger = Logger(); // Logger instance

  void handleAuthError(FirebaseAuthException e, {AppLocalizations? localizations}) {
    String message = _getAuthErrorMessage(e, localizations);
    ToastHelper.showToast(message);
  }

  String _getAuthErrorMessage(FirebaseAuthException e, AppLocalizations? localizations) {
    // Eğer lokalizasyon verilmişse onu kullan, yoksa varsayılan İngilizce mesajları kullan
    if (localizations != null) {
      switch (e.code) {
        case 'weak-password':
          return localizations.errorWeakPassword;
        case 'email-already-in-use':
          return localizations.errorEmailAlreadyInUse;
        case 'user-not-found':
          return localizations.errorUserNotFound;
        case 'wrong-password':
          return localizations.errorWrongPassword;
        default:
          return localizations.errorUnknown;
      }
    } else {
      // Fallback İngilizce mesajlar
      switch (e.code) {
        case 'weak-password':
          return 'The password provided is too weak.';
        case 'email-already-in-use':
          return "An account already exists with that email.";
        case 'user-not-found':
          return 'No user found for that email.';
        case 'wrong-password':
          return "Wrong password provided for that user.";
        default:
          return "An unknown error occurred.";
      }
    }
  }

  void handleUnknownError(Exception e, {AppLocalizations? localizations}) {
    logger.e("Error: $e"); // Consider using a logging package here for more structured logging
    String message = localizations?.errorUnexpected ?? "An unexpected error occurred.";
    ToastHelper.showToast(message);
  }
}
