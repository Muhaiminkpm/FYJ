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

  // GlobalKey to handle form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Resource',
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey, // Assign the form key
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null; // Return null if valid
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Experience',
                  style: GoogleFonts.openSans(),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter experience',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter experience';
                    }
                    return null; // Return null if valid
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Technology',
                  style: GoogleFonts.openSans(),
                ),

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
                      selectedTechnology =
                          value; // Store the selected technology
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a technology';
                    }
                    return null; // Return null if valid
                  },
                  value: selectedTechnology,
                  hint: const Text('Select Technology'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone',
                  style: GoogleFonts.openSans(),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null; // Return null if valid
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Resume',
                  style: GoogleFonts.openSans(),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  width: 60,
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ),
                const SizedBox(height: 10),
                const Text('Only pdf, jpg, and doc files allowed'),

                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(350, 30),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, show a simple message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Resource added successfully!')),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.openSans(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
