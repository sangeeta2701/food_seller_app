import 'package:flutter/material.dart';
import 'package:food_seller_app/utils/colors.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        orange500Color,
      ),
    ),
  );
}
