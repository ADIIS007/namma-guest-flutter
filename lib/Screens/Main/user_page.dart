import 'package:flutter/material.dart';
import 'package:namma_guest/Screens/User/map_page.dart';
import 'package:namma_guest/Screens/User/user_list_page.dart';
import 'package:namma_guest/Screens/User/user_profile_page.dart';
import 'package:permission_handler/permission_handler.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const MapPage(),
    const UserListPage(),
    UserProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationPermissionStatus();
  }

  Future<void> _onItemTapped(int index) async {
    PermissionStatus status = await _locationStatus;
    if(status.isDenied || status.isPermanentlyDenied){
      _requestLocationPermission();
      return;
    } else if(status.isGranted){
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<PermissionStatus> get _locationStatus async => Permission.location.status;

  Future<void> _checkLocationPermissionStatus() async{
    PermissionStatus status = await _locationStatus;
    if(status.isDenied){
      _requestLocationPermission();
    } else if (status.isGranted){
      print('Location permission granted');
      return;
    } else if(status.isPermanentlyDenied){
      openAppSettings();
    }
  }

  Future<void> _requestLocationPermission() async{
    final status = await Permission.location.request();
    if(status.isGranted){
      print('Location permission granted');
    } else if(status.isDenied){
      _requestLocationPermission();
    } else if(status.isPermanentlyDenied){
      openAppSettings();
    }
  }
}