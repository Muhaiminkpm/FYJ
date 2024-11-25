// file: add_resource.dart


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fechresource.dart';

class AddResource extends StatefulWidget {
  final Function(Resource) onAddResource; // Callback to pass data

  const AddResource({super.key, required this.onAddResource});

  @override
  State<AddResource> createState() => _AddResourceState();
}

class _AddResourceState extends State<AddResource> {
  String? _pickedFilePath;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  String? selectedTechnology;
  final TextEditingController _phoneController = TextEditingController();

  // List of technologies for dropdown
  List<String> technologies = ['Flutter', 'React', '.NET', 'Node.js', 'Python'];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'], // Restrict to these formats
    );

    if (result != null) {
      setState(() {
        _pickedFilePath = result.files.single.path; // Get the full file path
      });
      print('File picked: $_pickedFilePath');
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Resource', style: GoogleFonts.ubuntu()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name input field
                Text('Name', style: GoogleFonts.openSans()),
                TextFormField(
                  controller: _nameController,
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
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Experience input field
                Text('Experience', style: GoogleFonts.openSans()),
                TextFormField(
                  controller: _experienceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter experience in years',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter experience';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Technology dropdown
                Text('Technology', style: GoogleFonts.openSans()),
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
                      selectedTechnology = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a technology';
                    }
                    return null;
                  },
                  value: selectedTechnology,
                  hint: const Text('Select Technology'),
                ),
                const SizedBox(height: 20),

                // Phone input field
                Text('Phone', style: GoogleFonts.openSans()),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Resume file picker
                Text('Resume', style: GoogleFonts.openSans()),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _pickedFilePath == null
                        ? IconButton(
                            onPressed: _pickFile,
                            icon: const Icon(Icons.attach_file),
                          )
                        : Text('Selected file: ${_pickedFilePath!.split('/').last}'),
                  ],
                ),
                const SizedBox(height: 20),

                // Submit button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newResource = Resource(
                          name: _nameController.text,
                          experience: _experienceController.text,
                          technology: selectedTechnology!,
                          phone: _phoneController.text,
                          resumePath: _pickedFilePath ?? '',
                        );

                        // Use the callback to pass the new resource to the parent screen
                        widget.onAddResource(newResource);
                        Navigator.pop(context); // Close the form
                      }
                    },
                    child: const Text('Add Resource'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
