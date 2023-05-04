import 'package:flutter/material.dart';
import 'package:food_seller_app/utils/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.controller,required this.data,required this.hintText,required this.enabled,required this.isObsecure});

  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: wColor,
        borderRadius: BorderRadius.all(Radius.circular(10),),

      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(data,color: orangeColor,),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,

        ),

      ),
    );
  }
}
