import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'pages/splash/splash_page.dart';

void main() {
  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,

      // Set the app title
      title: 'PNB-Bank',

      // Define the app theme
      theme: ThemeData(
        // Set background color to white
        scaffoldBackgroundColor: CupertinoColors.white,

        // AppBar styling
        appBarTheme: AppBarTheme(
          // Set AppBar background color
          backgroundColor: CupertinoColors.systemOrange,

          // Set text and icon color
          foregroundColor: CupertinoColors.black,

          // Add spacing around the title
          titleSpacing: 2,

          // Center the title in the AppBar
          centerTitle: true,

          // Style the title text
          titleTextStyle: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.black,
          ),

          // Style the icons in AppBar
          iconTheme: IconThemeData(size: 22, color: CupertinoColors.black),
        ),

        // Set the primary color to orange
        primaryColor: CupertinoColors.systemOrange,

        // Style the floating action button
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CupertinoColors.systemOrange,
          foregroundColor: CupertinoColors.black,
        ),
      ),

      // Set the SplashPage as the first screen
      home: const SplashPage(),

      // Initialize EasyLoading for showing loaders and toasts
      builder: EasyLoading.init(),
    );
  }
}
