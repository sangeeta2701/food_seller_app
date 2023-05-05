import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../widgets/customTextField.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(padding: EdgeInsets.all(15),
            child: Image.asset("assets/images/seller.png",height: 270,),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                        controller: emailController,
                        data: Icons.email,
                        hintText: "Email",
                        enabled: true,
                        isObsecure: false),
                CustomTextField(
                        controller: passwordController,
                        data: Icons.lock,
                        hintText: "Password",
                        enabled: true,
                        isObsecure: true),
              ],
            ),),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ElevatedButton(
              
              onPressed: () {
                print("Clicked");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                primary: wColor,
              ),
              child: Text(
                "Log In",
                style: GoogleFonts.poppins(
                  color: orange500Color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}