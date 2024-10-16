import 'dart:io';
import 'package:even_managment/home/widget/resource%20details/resource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


class AddResource extends StatefulWidget {
  const AddResource({super.key});

  @override
  State<AddResource> createState() => _AddResourceState();
}

class _AddResourceState extends State<AddResource> {
  XFile? _pickedImage;

  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // List of technologies for dropdown
  List<String> technologies = ['Flutter', 'React', '.NET', 'Node.js', 'Python'];
  String? selectedTechnology;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  void _submitResource() {
    if (_formKey.currentState!.validate()) {
      Resource newResource = Resource(
        name: _nameController.text,
        experience: _experienceController.text,
        technology: selectedTechnology!,
        phone: _phoneController.text,
        resumePath: _pickedImage?.path,
      );

      Navigator.pop(context, newResource);  // Pass the data back to the previous screen
    }
  }

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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
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

                // Experience Field
                Text('Experience', style: GoogleFonts.openSans()),
                TextFormField(
                  controller: _experienceController,
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
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Technology Dropdown
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

                // Phone Field
                Text('Phone', style: GoogleFonts.openSans()),
                TextFormField(
                  controller: _phoneController,
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
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Resume (Image) Picker
                Text('Resume', style: GoogleFonts.openSans()),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _pickedImage == null
                      ? IconButton(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.add),
                        )
                      : Image.file(
                          File(_pickedImage!.path),
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 30),

                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: const Size(350, 30),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: _submitResource,
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
