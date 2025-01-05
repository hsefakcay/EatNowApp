import 'package:flutter/material.dart';

class SnackbarService {
  static void showSnackbar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
