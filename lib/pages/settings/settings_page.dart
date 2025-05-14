import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List services = [
    {"serviceName": "Send Money", "btnIsTrue": false},
    {"serviceName": "Bills Pay", "btnIsTrue": false},
    {"serviceName": "Add Beneficiary", "btnIsTrue": false},
    {"serviceName": "Change Password", "btnIsTrue": false},
    {"serviceName": "E-Wallet", "btnIsTrue": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MFA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            SizedBox(height: 30),
            for (int i = 0; i < services.length; i++) ...{
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(services[i]["serviceName"]),
                      ),
                      Switch.adaptive(
                        activeColor: Theme.of(context).primaryColor,
                        value: services[i]["btnIsTrue"],
                        onChanged: (val) {
                          services[i]["btnIsTrue"] = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 5),
                ],
              ),
            },
            SizedBox(height: 10),
            Divider(color: Colors.black, thickness: 1.5),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Other Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            SizedBox(height: 10),
            Align(alignment: Alignment.topLeft, child: Text("Biometric")),
          ],
        ),
      ),
    );
  }
}
