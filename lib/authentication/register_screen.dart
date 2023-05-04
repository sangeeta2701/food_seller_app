import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_seller_app/utils/colors.dart';
import 'package:food_seller_app/widgets/customTextField.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController emailController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          InkWell(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.15,
              backgroundColor: wColor,
              backgroundImage: imageFile == null
                  ? null
                  : FileImage(
                      File(imageFile!.path),
                    ),
              child: imageFile == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      color: Colors.grey,
                      size: MediaQuery.of(context).size.width * 0.10,
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(controller: nameController, data: Icons.person, hintText: "Name", enabled: true, isObsecure: false),
                  CustomTextField(controller: emailController, data: Icons.email, hintText: "Email", enabled: true, isObsecure: false),
                  CustomTextField(controller: phoneController, data: Icons.call, hintText: "Phone Number", enabled: true, isObsecure: false),
                  CustomTextField(controller: passwordController, data: Icons.lock, hintText: "Password", enabled: true, isObsecure: true),
                  CustomTextField(controller: confirmPasswordController, data: Icons.lock, hintText: "Confirm Password", enabled: true, isObsecure: true),
                  CustomTextField(controller: locationController, data: Icons.location_on, hintText: "Cafe/Restaurant Address", enabled: true, isObsecure: false),
                ],
              )),
          )
        ],
      ),
    ));
  }
}
