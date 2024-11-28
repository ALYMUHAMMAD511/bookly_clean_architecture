import 'package:flutter/material.dart';

void showSnackBar(context, String text, Color color)
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: color,
    ),
  );
}