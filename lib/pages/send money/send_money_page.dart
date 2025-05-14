import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  // List of names
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
      appBar: AppBar(title: Text('Send Money')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select a beneficiary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  // List of items
                  Expanded(
                    child: ListView(
                      children:
                          names.map((name) {
                            // First letter for circle
                            String firstLetter = name[0].toUpperCase();
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: CupertinoColors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('+ ADD NEW BENEFICIARY'),
                  ),
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
