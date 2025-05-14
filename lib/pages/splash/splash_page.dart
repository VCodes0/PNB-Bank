import 'dart:async';

import '../login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:pnb_bank/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Controllers for User Name and User Password
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  // Method to get saved data from SharedPreferences
  void getData() async {
    // Creating an instance of SharedPreferences
    SharedPreferences sh = await SharedPreferences.getInstance();

    // Fetching stored username and password
    userName.text = sh.getString("userName") ?? "";
    userPassword.text = sh.getString("userPassword") ?? "";

    // Check if username and password are not empty
    if (userName.text.isNotEmpty && userPassword.text.isNotEmpty) {
      // Navigate to HomePage if credentials exist
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    } else {
      // Navigate to LoginPage if credentials are missing
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }

  // initState is called when the widget is inserted into the widget tree
  @override
  void initState() {
    super.initState();
    // Calling getData() on widget load
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Splash Screen UI
      body: Center(
        child: Card(
          // Shadow effect
          elevation: 5,
          // Card background color
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // Logo Image
            child: Image.asset("assets/pnb.png", height: 100),
          ),
        ),
      ),
    );
  }
}
