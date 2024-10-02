import 'package:flutter/material.dart';
import 'package:namma_guest/Screens/Main/owner_page.dart';

class WhatsappOnboardingPage extends StatefulWidget {
  const WhatsappOnboardingPage({super.key});

  @override
  State<WhatsappOnboardingPage> createState() => _WhatsappOnboardingPageState();
}

class _WhatsappOnboardingPageState extends State<WhatsappOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('We are building your hostel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/2.png',
              height: 250,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Hostel Whatsapp Number',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const OwnerPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
