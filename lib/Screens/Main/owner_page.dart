import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namma_guest/Screens/Admin/facilities_list_page.dart';
import 'package:namma_guest/Screens/Admin/rooms_list_page.dart';

class OwnerPage extends StatefulWidget {
  const OwnerPage({super.key});

  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize your look'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://images.squarespace-cdn.com/content/v1/60f1a490a90ed8713c41c36c/1629223610791-LCBJG5451DRKX4WOB4SP/37-design-powers-url-structure.jpeg',
                height: 200,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Name',
                  hintText: 'Enter the Hostel Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Description',
                  hintText: 'Enter the Hostel Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Address Line 1',
                  hintText: 'Enter the Hostel Address Line 1',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Address Line 2',
                  hintText: 'Enter the Hostel Address Line 2',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel State',
                  hintText: 'Enter the Hostel State',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel City',
                  hintText: 'Enter the Hostel City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Pincode',
                  hintText: 'Enter the Hostel Pincode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Email',
                  hintText: 'Enter the Hostel Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Phone',
                  hintText: 'Enter the Hostel Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel WhatsApp',
                  hintText: 'Enter the Hostel WhatsApp',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const RoomsListPage()),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('List of Rooms'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const FacilitiesListPage()),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('List of Features'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}