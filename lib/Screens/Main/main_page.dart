import 'package:flutter/material.dart';
import 'package:namma_guest/Api/api_service.dart';
import 'package:namma_guest/Model/api_response.dart';
import 'package:namma_guest/Screens/Admin/Onboarding/name_onboarding_page.dart';
import 'package:namma_guest/Screens/Main/user_page.dart';
import 'package:namma_guest/Service/shared_pref_login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/2.png',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome to the application.\nYour Account is verified.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _conformationBox(context, 'You are sure you are Search for Accommodation.\nThis action can not be reverted!!', UserPage(), "USER");
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Search for Accommodation',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _conformationBox(context, 'You are sure you are Owning/Listing an Accommodation.\nThis action can not be reverted!!', const NameOnboardingPage(), "OWNER");
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'List My Accommodation',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }

  void _conformationBox(BuildContext context, String description, Widget page, String type) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: const Text('AlertDialog Title'),
            content: Text(description),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async{
                  Map<String, String?> sharedPref = await SharedPrefLogin.getLoginDetails();
                  ApiResponse apiResponse = await ApiService().setUserType(sharedPref['token']!,type) as ApiResponse;
                  if (apiResponse.status) {
                    await SharedPrefLogin.saveLoginDetails(sharedPref['token']!, type);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => page),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: Text(apiResponse.response),
                      ),
                    );
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
      );
  }
}
