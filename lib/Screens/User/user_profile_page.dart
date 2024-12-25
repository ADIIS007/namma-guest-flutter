import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:namma_guest/Service/shared_pref_login.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  final TextEditingController _amountController = TextEditingController();

  final String userName = "John Doe";
  final String userEmail = "john.doe@example.com";
  final String phoneNumber = "7075955169";
  final String userImageUrl =
  'https://media.licdn.com/dms/image/v2/D5603AQHBpp0P22tz1w/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1724932714830?e=1736380800&v=beta&t=2oJCcmrS1jhShPrbSWNPIH-jMSs7RTaf1MTT3ud8sTY';

  final List<Map<String, String>> developers = [
    {
      'Position': 'Founder & Developer',
      'name': 'ADIIS007',
      'link': 'https://www.linkedin.com/in/athithya-ithayan-4891151bb/',
      'Bio': 'Full stack Java & Flutter developer',
      'pic':
          'https://media.licdn.com/dms/image/v2/D5603AQGqTE0_jDm4Uw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1714451350660?e=1736380800&v=beta&t=jJyXC6YSQXiY86rUSv-TI8XB5hoxQUUF5-WlJn2KSp0'
    },
    {
      'Position': 'Sales & Advt Manager',
      'name': 'Developer 2',
      'link': 'https://linkedin.com/in/developer2',
      'Bio': 'Full stack Java & Flutter developer',
      'pic':
          'https://media.licdn.com/dms/image/v2/D5603AQGqTE0_jDm4Uw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1714451350660?e=1736380800&v=beta&t=jJyXC6YSQXiY86rUSv-TI8XB5hoxQUUF5-WlJn2KSp0'
    },
    {
      'Position': 'Sr Developer',
      'name': 'Developer 3',
      'link': 'https://linkedin.com/in/developer3',
      'Bio': 'Full stack Java & Flutter developer',
      'pic':
          'https://media.licdn.com/dms/image/v2/D5603AQGqTE0_jDm4Uw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1714451350660?e=1736380800&v=beta&t=jJyXC6YSQXiY86rUSv-TI8XB5hoxQUUF5-WlJn2KSp0'
    },
    {
      'Position': 'Associate Developer',
      'name': 'Developer 4',
      'link': 'https://linkedin.com/in/developer4',
      'Bio': 'Full stack Java & Flutter developer',
      'pic':
          'https://media.licdn.com/dms/image/v2/D5603AQGqTE0_jDm4Uw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1714451350660?e=1736380800&v=beta&t=jJyXC6YSQXiY86rUSv-TI8XB5hoxQUUF5-WlJn2KSp0'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.help),
        title: const Center(child: Text('User Profile')),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  profile(context),
                  const SizedBox(height: 16),
                  developer(context),
                  const SizedBox(height: 16),
                  donate(context),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await SharedPrefLogin.clearLoginDetails();
                      exit(0);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 120.0), // Increase horizontal padding
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Log out',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }

  Widget profile(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(userImageUrl),
              ),
              const SizedBox(height: 16),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userEmail,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                phoneNumber,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.verified,
                      color: Colors.green
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Verified',
                    style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add functionality here
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Edit Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget developer(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: developers.map((developerItem) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(developerItem['pic'] ??
                      'https://media.licdn.com/dms/image/v2/C4D07AQGqZ1PBhLQe7w/group-logo_image-shrink_92x92/group-logo_image-shrink_92x92/0/1630999644296?e=1731769200&v=beta&t=OD8V_OtkxtnWw_1ZxUHGrt8rMzx5Ql9K1onnqdoB8nM'),
                ),
                Text(
                  developerItem['name']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    _launchUrl(developerItem['link']!);
                  },
                  child: const Text(
                    'LinkedIn Profile',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget donate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.live_help_outlined,
                      color: Colors.grey
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Donate to the Project',
                    style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'This takes a lot of effort to create and maintain some of the open source project you can share the cost with donations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.attach_money),
                  labelText: 'Enter amount',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: () {
                _showToast(_amountController.text);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Donate',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      launch(url);
    } else {
      _showToast("Invalid URL: $url");
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
