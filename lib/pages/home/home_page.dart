import 'dart:async';
import 'package:flutter/material.dart';
import '../settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:pnb_bank/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pnb_bank/pages/send%20money/send_money_page.dart';
import 'package:pnb_bank/pages/add%20benificialy/add_benificialy_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Grid data with labels and image paths
  List<Map<String, String>> iconList = [
    {"Label": "Send Money", "img": "assets/Send_Money.jpg"},
    {"Label": "Bills Pay", "img": "assets/E-Wallat.jpg"},
    {"Label": "Add Beneficially", "img": "assets/Add_Beneficiary.jpg"},
    {"Label": "Change Password", "img": "assets/Change_Password.jpg"},
    {"Label": "E-Wallet", "img": "assets/E-Wallat.jpg"},
  ];

  // Drawer menu items with icons, titles, and linked pages
  final List<Map<String, dynamic>> drawerItems = [
    {"icon": Icons.settings, "title": "Settings", "page": SettingsPage()},
    {
      "icon": CupertinoIcons.money_dollar,
      "title": "Send Money",
      "page": SendMoneyPage(),
    },
    {
      "icon": Icons.add_box,
      "title": "Add Beneficially",
      "page": AddBeneficiallyPage(),
    },
  ];

  // Logout method: removes login data and redirects to LoginPage
  void logOut() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("userName");
    sh.remove("userPassword");

    // Show a quick toast
    EasyLoading.showToast("Please Wait...");

    // Delay for 2 seconds, then navigate to login screen
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Close keyboard if screen is tapped outside any input field
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        // Left drawer navigation menu
        drawer: Drawer(
          backgroundColor: Theme.of(context).primaryColor,
          child: Column(
            children: [
              // Drawer header with user info
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.orangeAccent.shade700,child: Icon(CupertinoIcons.person_fill,color: CupertinoColors.black,),),
                    SizedBox(width: 15.0),
                    Text("Vishnu Prajapati"),
                  ],
                ),
              ),

              // Drawer items (Settings, Send Money, Add Beneficiary)
              Expanded(
                child: Column(
                  children: [
                    for (var item in drawerItems) ...{
                      ListTile(
                        onTap: () {
                          Navigator.pop(context); // Close drawer
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item["page"],
                            ),
                          );
                        },
                        leading: Icon(
                          item["icon"],
                          color: CupertinoColors.black,
                        ),
                        title: Text(
                          item["title"],
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                        trailing: Icon(
                          CupertinoIcons.arrow_right,
                          color: CupertinoColors.black,
                        ),
                      ),
                      SizedBox(height: 4.0),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),

        // Floating logout button
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => logOut(),
          label: Text("Log Out"),
          icon: Icon(Icons.logout),
        ),

        // App bar title
        appBar: AppBar(title: Text("PNB-Bank")),

        // Body content
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // App logo
                Image.asset("assets/pnb.png", height: 90),
                const SizedBox(height: 10),

                // Grid with service icons
                Expanded(
                  child: GridView(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 12.0, // Space between columns
                      mainAxisSpacing: 12.0, // Space between rows
                    ),
                    children: [
                      // Loop through icon list to create cards
                      for (int i = 0; i < iconList.length; i++) ...{
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Display service image
                              Image.asset(
                                iconList[i]["img"]!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 10),

                              // Display service name
                              Text(
                                iconList[i]["Label"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      },
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
