import 'package:firebase_security/core/utils/color_constants.dart';
import 'package:flutter/material.dart';

void snackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorConstants.pink,
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        style: const TextStyle(color: ColorConstants.white),
      ),
    ),
  );
}
