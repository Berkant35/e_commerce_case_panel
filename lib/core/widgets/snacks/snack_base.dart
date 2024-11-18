import 'package:flutter/material.dart';

import '../../enums/snack_bar_type.dart';

class SnackBase {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    required SnackBarType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: getSnackBarColor(type),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Color getSnackBarColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.failed:
        return Colors.red;
      case SnackBarType.info:
      default:
        return Colors.blue;
    }
  }
}
