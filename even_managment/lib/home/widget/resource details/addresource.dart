import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddResource extends StatefulWidget {
  const AddResource({super.key});

  @override
  State<AddResource> createState() => _AddResourceState();
}

class _AddResourceState extends State<AddResource> {
  // List of technologies for dropdown
  List<String> technologies = ['Flutter', 'React', '.NET', 'Node.js', 'Python'];

  // Variable to hold the selected technology
  String? selectedTechnology;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Resource',
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: GoogleFonts.openSans(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter name',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Experience',
              style: GoogleFonts.openSans(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter experience',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Technology',
              style: GoogleFonts.openSans(),
            ),
            const SizedBox(height: 10),
            // Dropdown for selecting technology
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: technologies.map((String technology) {
                return DropdownMenuItem<String>(
                  value: technology,
                  child: Text(technology),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedTechnology = value; // Store the selected technology
                });
              },
              value: selectedTechnology,
              hint: const Text('Select Technology'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone',
              style: GoogleFonts.openSans(),
            ),
            const SizedBox(height: 10),
             TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter number',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Resume',style: GoogleFonts.openSans(),),
            SizedBox(height: 10,),
            
            
           
          ],
        ),
      ),
    );
  }
}
