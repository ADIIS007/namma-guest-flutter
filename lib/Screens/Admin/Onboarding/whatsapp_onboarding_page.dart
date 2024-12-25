import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:namma_guest/Api/api_service.dart';
import 'package:namma_guest/Model/api_response.dart';
import 'package:namma_guest/Model/paying_guest_model.dart';
import 'package:namma_guest/Screens/Main/owner_page.dart';

import '../../../Service/validation.dart';

class WhatsappOnboardingPage extends StatefulWidget {
  final PayingGuest payingGuest;
  const WhatsappOnboardingPage({super.key,required this.payingGuest});

  @override
  State<WhatsappOnboardingPage> createState() => _WhatsappOnboardingPageState();
}

class _WhatsappOnboardingPageState extends State<WhatsappOnboardingPage> {
  final TextEditingController _controller = TextEditingController();
  ApiService apiService = ApiService();

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
                onPressed: () async {
                  if(_controller.text.isEmpty || _controller.text.length != 10 || int.tryParse(_controller.text)==null || !ValidationService.validatePhoneNumber(_controller.text)) {
                    _toastMessage("Enter a proper phone Number");
                  } else {
                    widget.payingGuest.setWhatsappNumber = _controller.text;
                    print(widget.payingGuest);
                    ApiResponse apiResponse = await apiService.createPg(widget.payingGuest) as ApiResponse;
                    if(apiResponse.status){
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const OwnerPage()),
                            (Route<dynamic> route) => false,
                      );
                    } else {
                      _toastMessage(apiResponse.response);
                    }
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
