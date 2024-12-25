
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:namma_guest/Model/paying_guest_model.dart';
import 'package:namma_guest/Screens/Admin/Onboarding/whatsapp_onboarding_page.dart';
import 'package:namma_guest/Service/validation.dart';

class PhoneNumberOnboardingPage extends StatefulWidget {
  final PayingGuest payingGuest;
  const PhoneNumberOnboardingPage({super.key,required this.payingGuest});

  @override
  State<PhoneNumberOnboardingPage> createState() => _PhoneNumberOnboardingPageState();
}

class _PhoneNumberOnboardingPageState extends State<PhoneNumberOnboardingPage> {
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
                labelText: 'Enter Hostel Phone Number',
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
                  if(_controller.text.isEmpty || _controller.text.length != 10 || int.tryParse(_controller.text)==null || !ValidationService.validatePhoneNumber(_controller.text)) {
                    _toastMessage("Enter a proper phone Number");
                  } else {
                    print("Enter a proper phone Number "+_controller.text);
                    widget.payingGuest.setPhone = _controller.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => WhatsappOnboardingPage(payingGuest: widget.payingGuest,)),
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
