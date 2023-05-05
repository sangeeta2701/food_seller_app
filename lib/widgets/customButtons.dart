import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget whiteButton(String buttonText) {
  return Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
        color: wColor,
        borderRadius: BorderRadius.all(Radius.circular(10),),

      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Center(child: Text(buttonText),),
  );
}
