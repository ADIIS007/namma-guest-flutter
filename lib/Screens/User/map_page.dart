import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' hide PermissionStatus;
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final Location _locationService = Location();
  bool _isLocationPresent = false;
  late LatLng _location;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40, // Diameter of the circle
                height: 40, // Diameter of the circle
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.shade100, // Background color of the circle
                ),
                child: const Center(
                  child: Icon(
                    Icons.home, // Replace with your desired icon
                    color: Colors.purple, // Color of the icon
                    size: 24, // Size of the icon
                  ),
                ),
              ),
            ),
            title: const Text('OpenStreetMap Example')),
        body: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _isLocationPresent ? _location : const LatLng(0.0, 0.0),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                if (_isLocationPresent) // Only display marker if location is present
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: _location,
                        child: Icon(
                          Icons.location_searching,
                          color: Colors.purple.shade200,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ));
  }

  Future<void> _checkLocationPermission() async {
    PermissionStatus permission = await Permission.location.status;
    if(permission.isDenied || permission.isPermanentlyDenied){
      if(await Permission.location.request().isGranted){
        _checkLocationService();
      } else {
        _toastMessage("Permission is denied. kindly enable it from settings");
      }
    } else if(permission.isGranted){
      _checkLocationService();
    }
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

  Future<void> _checkLocationService() async {
    bool isLocationServiceEnabled = await _locationService.serviceEnabled();
    if(isLocationServiceEnabled){
      _getLocationData();
    } else {
      bool serviceStatus = await _locationService.requestService();
      if(serviceStatus){
        _getLocationData();
      } else {
        _toastMessage("Location service is disabled. kindly enable it from settings");
      }
    }
  }

  Future<void> _getLocationData() async {
    try {
      LocationData locationData = await _locationService.getLocation();
        print("Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}");
        setState(() {
          _isLocationPresent = true;
          _location = LatLng(locationData.latitude!, locationData.longitude!);
          _mapController.move(_location, 13.0);
        });
    } catch (e) {
      print("Error: $e");
    }
  }
}
