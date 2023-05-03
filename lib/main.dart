import 'package:flutter/material.dart';
import 'package:food_seller_app/Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: SplashScreen(),
    );
  }
}
