import 'package:fluttertoast/fluttertoast.dart';
import 'package:yemek_soyle_app/app/core/constants/color_constants.dart';

class ToastHelper {
  ToastHelper._();

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: AppColorConstants.redColor,
      fontSize: 16,
    );
  }
}
