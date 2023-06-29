import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_seller_app/Screens/splash_screen.dart';
// import 'package:food_seller_app/authentication/auth_screen.dart';
import 'package:food_seller_app/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sellers App",
      debugShowCheckedModeBanner: false,
      // home: AuthScreen(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}
