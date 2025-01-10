import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.black.withOpacity(0.5),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
