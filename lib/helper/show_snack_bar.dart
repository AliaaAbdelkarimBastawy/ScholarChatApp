import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String message, Color MessageBgColor) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: MessageBgColor,
          content: Text(message,
            style: const TextStyle(color: Colors.white),)
      ));
}
