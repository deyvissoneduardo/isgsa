import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
      ),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }
}
