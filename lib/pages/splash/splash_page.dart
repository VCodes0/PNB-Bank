import 'dart:async';
import '../login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:pnb_bank/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SplashPage widget (stateful)
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Controllers to store username and password
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  // Method to check if user data is saved
  void getData() async {
    // Access local storage
    SharedPreferences sh = await SharedPreferences.getInstance();

    // Get saved username and password or empty string if not found
    userName.text = sh.getString("userName") ?? "";
    userPassword.text = sh.getString("userPassword") ?? "";

    // If both username and password are available
    if (userName.text.isNotEmpty && userPassword.text.isNotEmpty) {
      // Go to HomePage after 2 seconds
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    } else {
      // Go to LoginPage after 2 seconds
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }

  // Called when the screen is loaded
  @override
  void initState() {
    super.initState();
    // Call getData to check saved login info
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main splash screen layout
      body: Center(
        child: Card(
          // Add shadow to card
          elevation: 5,
          // Set card background color same as screen
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // Show app logo
            child: Image.asset("assets/pnb.png", height: 100),
          ),
        ),
      ),
    );
  }
}
