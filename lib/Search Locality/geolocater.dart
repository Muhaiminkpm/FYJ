import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class FetchLocation extends StatefulWidget {
  const FetchLocation({super.key});

  @override
  State<FetchLocation> createState() => _FetchLocationState();
}

class _FetchLocationState extends State<FetchLocation> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled, return
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, return
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are permanently denied, return
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Get the current location with high accuracy
      _currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high, // Updated to use LocationSettings
          distanceFilter: 10, // Optional: set a distance filter
        ),
      );

      setState(() {
        _currentAddress =
            'Lat: ${_currentPosition!.latitude}, Long: ${_currentPosition!.longitude}';
      });
    } catch (e) {
      print('Error while fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location'),
      ),
      body: Center(
        child: SizedBox(
          width: 200, // Define a width
          height: 100, // Define a height
          child: _currentPosition == null
              ? const CircularProgressIndicator()
              : Align(
                  alignment: Alignment.center, // Center the text
                  child: Text(
                    _currentAddress ?? 'Fetching location...',
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
        ),
      ),
    );
  }
}
