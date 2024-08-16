import 'package:flutter/material.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

void showSnakBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
  ));
}
