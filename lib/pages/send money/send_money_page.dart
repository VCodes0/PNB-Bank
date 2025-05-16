import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  // List of beneficiary names
  List<String> names = [
    'Vishnu Prajapati',
    'Partham Soni',
    'ChandaSeekbar Sir',
    'Maulik Bhai',
    'Kavya Bhai',
    'Harsh Bhai',
    'Deves Bhai',
    'Roshan Bhai',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: AppBar(title: Text('Send Money')),

      // SafeArea to avoid notches and overlays
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),

          // Main card container
          child: Card(
            color: Colors.orange.shade50,

            // Padding inside the card
            child: Padding(
              padding: EdgeInsets.all(20),

              // Vertical layout
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading text
                  Text(
                    'Select a beneficiary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 16),

                  // List of beneficiaries
                  Expanded(
                    child: ListView(
                      children:
                          names.map((name) {
                            // Get the first letter of name for avatar
                            String firstLetter = name[0].toUpperCase();

                            // List item for each name
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange.shade100,
                                foregroundColor: Colors.deepOrange,
                                child: Text(firstLetter),
                              ),
                              title: Text(name),
                              trailing: Icon(CupertinoIcons.forward),
                            );
                          }).toList(),
                    ),
                  ),

                  // Button to add a new beneficiary
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: CupertinoColors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('+ ADD NEW BENEFICIARY'),
                  ),

                  // Text button for corporate beneficiary option
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: CupertinoColors.black,
                      ),
                      onPressed: () {},
                      child: Text('Corporate beneficiary? Enroll'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
