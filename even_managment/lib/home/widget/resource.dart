// file: resource_screen.dart

import 'package:even_managment/home/widget/resource%20details/fechresource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:even_managment/home/widget/resource%20details/addresource.dart';
import 'package:even_managment/Screens/PDF/pdfscreen.dart'; // Ensure the path is correct
import 'resource.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  // List of resources to display
  List<Resource> resources = [
    Resource(
      name: 'John Deo',
      experience: '5+ Years of Exp.',
      technology: 'Graphic Designer',
      phone: '+91 88665 88665',
      resumePath:
          'path/to/resume.pdf', // Update this with a real path if needed
    ),
    Resource(
      name: 'Mark Johnson',
      experience: '7+ Years of Exp.',
      technology: 'React Developer',
      phone: '+91 99887 99887',
      resumePath:
          'path/to/resume.jpg', // Update this with a real path if needed
    ),
  ];

  // Callback function to add a new resource
  void _addResource(Resource newResource) {
    setState(() {
      resources.add(newResource); // Add new resource to the list
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
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
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
