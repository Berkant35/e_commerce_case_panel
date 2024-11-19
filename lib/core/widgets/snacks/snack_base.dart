import 'package:flutter/material.dart';

import '../../enums/snack_bar_type.dart';

class SnackBase {

  static void showSnackBar(
    BuildContext context, {
    required String message,
    required SnackBarType type,
  }) =>  showTopSnackBar(context, message, getSnackBarColor(type));


  static void showTopSnackBar(BuildContext context, String message, Color backgroundColor) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16, // Status bar + margin
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );

    // Show the snackbar
    overlay.insert(overlayEntry);

    // Remove after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
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
