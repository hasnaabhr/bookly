import 'package:flutter/material.dart';

void customeSnackBar(context, String text) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}