import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

enum Type {
  success,
  error,
  info,
  warning,
}

extension on Type {
  AnimatedSnackBarType get value {
    switch (this) {
      case Type.success:
        return AnimatedSnackBarType.success;
      case Type.error:
        return AnimatedSnackBarType.error;
      case Type.info:
        return AnimatedSnackBarType.info;
      case Type.warning:
        return AnimatedSnackBarType.warning;
    }
  }
}

class CustomSnackBar {
  static void show({
    required String message,
    required Type type,
    required BuildContext context,
  }) {
    return AnimatedSnackBar.material(
      message,
      type: type.value,
      duration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }
}
