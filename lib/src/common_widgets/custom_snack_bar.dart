import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String title) {
  final snackBar = SnackBar(
      elevation: 4,
      behavior: SnackBarBehavior.floating,
      content: Text(title));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}