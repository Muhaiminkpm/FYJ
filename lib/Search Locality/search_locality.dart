
import 'package:flutter/material.dart';


class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Location'),
       
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
          
               // Shows loader while fetching location
          ],
        ),
      ),
    );
  }
}
