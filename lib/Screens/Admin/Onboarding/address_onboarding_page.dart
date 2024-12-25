import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:namma_guest/Model/paying_guest_model.dart';
import 'package:namma_guest/Screens/Admin/Onboarding/state_onboarding_page.dart';

class AddressOnboardingPage extends StatefulWidget {
  final PayingGuest payingGuest;

  const AddressOnboardingPage({super.key,required this.payingGuest});

  @override
  State<AddressOnboardingPage> createState() => _AddressOnboardingPageState();
}

class _AddressOnboardingPageState extends State<AddressOnboardingPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

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
              controller: _controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Hostel Address Line 1',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Hostel Address Line 2',
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
                  if(_controller1.text.isEmpty || _controller2.text.isEmpty) {
                    _toastMessage('Please enter address it can not be empty');
                  }
                  else if (_controller1.text.length>=255 || _controller2.text.length>=255) {
                    _toastMessage('Address should not exceed 255 characters');
                  }
                  else {
                    String address = "${_controller1.text}\n${_controller2.text}";
                    widget.payingGuest.setAddress = address;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => StateOnboardingPage(payingGuest: widget.payingGuest,)),
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
