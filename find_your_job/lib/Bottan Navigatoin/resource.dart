// file: resource_screen.dart

import 'dart:convert'; // Needed for encoding/decoding JSON

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resource details/addresource.dart';
import '../resource details/fechresource.dart';
import '../Screens/pdf_screen.dart'; // Import SharedPreferences


class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  // List of resources to display
  List<Resource> resources = [];

  @override
  void initState() {
    super.initState();
    _loadResources(); // Load resources from SharedPreferences when the app starts
  }

  // Step 3.1: Method to load resources from SharedPreferences
  Future<void> _loadResources() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? resourcesJson = prefs.getString('resources');
    
    if (resourcesJson != null) {
      List<dynamic> jsonData = jsonDecode(resourcesJson);
      setState(() {
        resources = jsonData.map((item) => Resource.fromJson(item)).toList();
      });
    }
  }

  // Step 3.2: Method to save resources to SharedPreferences
  Future<void> _saveResources() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String resourcesJson = jsonEncode(resources.map((res) => res.toJson()).toList());
    await prefs.setString('resources', resourcesJson);
  }

  // Callback function to add a new resource
  void _addResource(Resource newResource) {
    setState(() {
      resources.add(newResource); // Add new resource to the list
      _saveResources(); // Save the updated list to SharedPreferences
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('All Resources', style: GoogleFonts.ubuntu(fontSize: 18)),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: resources.length, // Number of resources to display
        itemBuilder: (context, index) {
          final resource = resources[index];
          return buildResourceTile(resource);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddResource(
                  onAddResource:
                      _addResource), // Passing callback to AddResource screen
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Helper function to build the resource tile UI
  Widget buildResourceTile(Resource resource) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and Resume button row
          Row(
            children: [
              Expanded(
                child: Text(
                  resource.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Only open the viewer if resumePath is not empty
                  if (resource.resumePath != null &&
                      resource.resumePath!.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FileViewerScreen(
                          filePath: resource.resumePath!,
                        ),
                      ),
                    );
                  } else {
                    // Display a message if no resume is available
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No resume available')),
                    );
                  }
                },
                child:
                    const Text('Resume', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          // Experience text
          Text(
            resource.experience,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(thickness: 1),

          // Role and Phone number row
          Row(
            children: [
              const Icon(Icons.computer, size: 18),
              const SizedBox(width: 5),
              Text(resource.technology),
              const SizedBox(width: 20),
              const Icon(Icons.phone, size: 18),
              const SizedBox(width: 5),
              Text(resource.phone),
            ],
          ),
        ],
      ),
    );
  }
}
