import 'package:ecommerce_app/core/constants.dart';
import 'package:flutter/material.dart';

extension ExtensionContext on BuildContext {
  showSnakBar({required String message, bool success = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? kPrimaryColor : Colors.red,
      ),
    );
  }
}
