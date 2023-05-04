import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_seller_app/authentication/auth_screen.dart';
import 'package:food_seller_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(Duration(seconds: 4), () async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: wColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splash.jpg"),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Sell Food Online",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: bColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
