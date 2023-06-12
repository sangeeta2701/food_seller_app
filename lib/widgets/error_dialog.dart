import 'package:flutter/material.dart';
import 'package:food_seller_app/utils/colors.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: orange500Color,
          ),
          child: Center(
            child: Text("OK"),
          ),
        ),
      ],
    );
  }
}
