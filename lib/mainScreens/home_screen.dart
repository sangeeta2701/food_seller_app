import 'package:flutter/material.dart';
import 'package:food_seller_app/authentication/auth_screen.dart';
import 'package:food_seller_app/global/global.dart';
import 'package:food_seller_app/utils/colors.dart';

import '../widgets/loading_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sharedPreferences!.getString("name")!),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.orange.shade500,
                  Colors.orange,
                  Colors.orange.shade200,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: orangeColor,
            ),
            onPressed: () {
               showDialog(
              context: context,
              builder: (c) {
                return LoadingDialog(message: "LoggingOut!!");
              });
              firebaeAuth.signOut().then((value){
                showDialog(
              context: context,
              builder: (c) {
                return LoadingDialog(message: "LoggingOut!!");
              });
                 Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuthScreen(),),);

              });
             
            },
            child: Text(
              "Logout",
              style: TextStyle(color: wColor),
            )),
      ),
    );
  }
}
