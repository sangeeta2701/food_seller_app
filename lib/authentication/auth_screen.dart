import 'package:flutter/material.dart';
import 'package:food_seller_app/authentication/login_screen.dart';
import 'package:food_seller_app/authentication/register_screen.dart';
import 'package:food_seller_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orange.shade500,
              Colors.orange,
              Colors.orange.shade200,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            tileMode: TileMode.clamp),
          ),
        ),
        // backgroundColor: wColor,
        centerTitle: true,
        title: Text("iFood",
        style: GoogleFonts.lobster(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: wColor,
        ),),
        bottom: TabBar(
          indicatorColor: wColor,
          indicatorWeight: 4,
          tabs: [
          Tab(icon: Icon(Icons.lock,color: wColor,),
          text: "Login",),
          Tab(icon: Icon(Icons.person,color: wColor,),
          text: "Register",),
        ]),
      ),
      body: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orange.shade500,
              Colors.orange,
              Colors.orange.shade200,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight
            ),
          ),
          child: TabBarView(children: [
            LoginScreen(),
            RegisterScreen(),
          ]),
      ),
    ));
  }
}