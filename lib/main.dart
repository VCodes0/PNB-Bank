import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'pages/splash/splash_page.dart';

void main() {
  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,

      // Set the app title
      title: 'PNB-Bank',

      theme: ThemeData(
        // Set the scaffold (background) color to white
        scaffoldBackgroundColor: CupertinoColors.white,

        appBarTheme: AppBarTheme(
          // Set AppBar background color to orange
          backgroundColor: CupertinoColors.systemOrange,

          // Set the text color in AppBar to black
          foregroundColor: CupertinoColors.black,

          // Set spacing around the title in AppBar
          titleSpacing: 2,

          // Center the title in the AppBar
          centerTitle: true,

          titleTextStyle: TextStyle(
            // Set font size of the title
            fontSize: 20,

            // Set spacing between the title letters
            letterSpacing: 2,

            // Make the title text bold
            fontWeight: FontWeight.bold,

            // Set title text color to black
            color: CupertinoColors.black,
          ),

          // Set icon size and color in AppBar
          iconTheme: IconThemeData(size: 22, color: CupertinoColors.black),
        ),
        primaryColor: CupertinoColors.systemOrange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CupertinoColors.systemOrange,
          foregroundColor: CupertinoColors.black,
        ),
      ),

      // Set SplashPage as the home page
      home: const SplashPage(),

      // This line initializes FlutterEasyLoading by wrapping the app's widget tree,
      // allowing overlays like loading spinners and toast messages to be displayed.
      builder: EasyLoading.init(),
    );
  }
}
