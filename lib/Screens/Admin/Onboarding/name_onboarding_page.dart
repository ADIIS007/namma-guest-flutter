import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:namma_guest/Model/paying_guest_model.dart';
import 'package:namma_guest/Screens/Admin/Onboarding/description_onboarding_page.dart';

class NameOnboardingPage extends StatefulWidget {
  const NameOnboardingPage({super.key});
  @override
  State<NameOnboardingPage> createState() => _NameOnboardingPageState();
}

class _NameOnboardingPageState extends State<NameOnboardingPage> {
  final TextEditingController _controller = TextEditingController();

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
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Hostel Name',
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
                  if(_controller.text.length<=3) {
                    _toastMessage("Hostel Name must be more than 3 characters");
                  }
                  else if (_controller.text.length>=255) {
                    _toastMessage("Hostel Name must be more than 255 characters");
                  }
                  else {
                    PayingGuest payingGuest = PayingGuest();
                    payingGuest.setName = _controller.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (
                          context) => DescriptionOnboardingPage(payingGuest: payingGuest,)),
                    );
                  }
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

  void _toastMessage(String msg) async {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
