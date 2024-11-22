
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  Position? _currentPosition;
  String? _currentAddress;

  Future<void> _fetchLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Get the current location
      _currentPosition = await Geolocator.getCurrentPosition(
         desiredAccuracy: LocationAccuracy.low);

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
        title: const Text('Search Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _fetchLocation, // Corrected to fetch location on press
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration:const  InputDecoration(
                hintText: 'Search city or state...',
                border:  OutlineInputBorder(),
                suffixIcon:  Icon(Icons.location_on),
              ),
              onChanged: (value) {
                // Implement logic for location suggestions
                print('Search input: $value');
              },
            ),
            const SizedBox(height: 20),
            if (_currentAddress != null)
              Text(
                'Current Location: $_currentAddress',
                style: const TextStyle(fontSize: 16),
              )
            else
              const CircularProgressIndicator(), // Shows loader while fetching location
          ],
        ),
      ),
    );
  }
}
