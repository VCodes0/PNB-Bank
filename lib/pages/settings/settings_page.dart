import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // List of services with switch button state
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
      // AppBar with title
      appBar: AppBar(title: Text("Settings")),

      // Main body content with padding
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        // Layout the content vertically
        child: Column(
          children: [
            // MFA Section header
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

            // Loop through services list to show switches
            for (int i = 0; i < services.length; i++) ...{
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Show service name
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(services[i]["serviceName"]),
                      ),

                      // Switch to enable/disable service
                      Switch.adaptive(
                        activeColor: Theme.of(context).primaryColor,
                        value: services[i]["btnIsTrue"],
                        onChanged: (val) {
                          services[i]["btnIsTrue"] = val;
                          setState(() {}); // Update UI
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 5),
                  Divider(color: Colors.grey, thickness: 1), // Line separator
                  SizedBox(height: 5),
                ],
              ),
            },

            SizedBox(height: 10),

            // Divider between sections
            Divider(color: Colors.black, thickness: 1.5),

            SizedBox(height: 10),

            // Other settings section header
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

            // Biometric option
            Align(alignment: Alignment.topLeft, child: Text("Biometric")),
          ],
        ),
      ),
    );
  }
}
