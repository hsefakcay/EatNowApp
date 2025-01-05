import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:yemek_soyle_app/app/core/utils/toast_helper.dart';

class ErrorService {
  final Logger logger = Logger(); // Logger instance

  void handleAuthError(FirebaseAuthException e) {
    String message = _getAuthErrorMessage(e);
    ToastHelper.showToast(message);
  }

  String _getAuthErrorMessage(FirebaseAuthException e) {
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

  void handleUnknownError(Exception e) {
    logger.e("Error: $e"); // Consider using a logging package here for more structured logging
    ToastHelper.showToast("An unexpected error occurred.");
  }
}
