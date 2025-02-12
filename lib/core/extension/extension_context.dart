import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:flutter/material.dart';

extension ExtensionContext on BuildContext {
  showSnakBar({required String message, bool success = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Styles.textStyle14.copyWith(color: Colors.white),
        ),
        backgroundColor: success ? kPrimaryColor : Colors.red,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        closeIconColor: Colors.white,
        showCloseIcon: true,
      ),
    );
  }
}
