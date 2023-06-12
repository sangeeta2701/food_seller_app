import 'package:flutter/material.dart';
import 'package:food_seller_app/utils/colors.dart';
import 'package:food_seller_app/widgets/progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          SizedBox(height: 10,),
          // ignore: prefer_interpolation_to_compose_strings
          Text(message+"Please Wait.....")
        ]),
    );
  }
}
