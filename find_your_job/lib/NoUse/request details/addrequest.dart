import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'fechrequest.dart'; // Import RequestData

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  List<num> selectNum = List.generate(20, (int index) => index + 1); // Experience years
  num? startExperience;
  num? endExperience;
  List<String> selectJob = [
    'Net Developer',
    'Accountant',
    'Graphic Designer ',
    'Teacher',
    'Logistics',
    'Digital Marketer',
    'Civil Engineer',
    'Electrician',
    'Sales Executive ',
    'Hotel Manager'
  ]; // Job selection
  String? Valuechoose;
  String description = '';

  // Validation method
  bool validateForm() {
    if (Valuechoose == null) {
      showErrorMessage('Please select a job.');
      return false;
    }
    if (startExperience == null || endExperience == null) {
      showErrorMessage('Please select experience range.');
      return false;
    }
    if (startExperience != null && endExperience != null && startExperience! >= endExperience!) {
      showErrorMessage('End experience should be greater than start experience.');
      return false;
    }
    if (description.isEmpty) {
      showErrorMessage('Please enter a description.');
      return false;
    }
    return true;
  }

  // Method to display error message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Request',
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown for job selection
              Text('Technology', style: GoogleFonts.openSans()),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
                items: selectJob.map((String valueitem) {
                  return DropdownMenuItem<String>(
                    value: valueitem,
                    child: Text(valueitem),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    Valuechoose = value;
                  });
                },
                value: Valuechoose,
                hint: const Text('Select Job'),
              ),
              const SizedBox(height: 20),

              // Experience dropdowns
              Text('Experience', style: GoogleFonts.openSans()),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<num>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      items: selectNum.map((num value) {
                        return DropdownMenuItem<num>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (num? value) {
                        setState(() {
                          startExperience = value;
                        });
                      },
                      value: startExperience,
                      hint: const Text('Start'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<num>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      items: selectNum.map((num value) {
                        return DropdownMenuItem<num>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (num? value) {
                        setState(() {
                          endExperience = value;
                        });
                      },
                      value: endExperience,
                      hint: const Text('End'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Description field
              Text('Description', style: GoogleFonts.openSans()),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  hintText: 'Enter details here...',
                ),
                maxLines: 4,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Add Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(350, 30),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (validateForm()) {
                    RequestData.fetchRequestsFromApi();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Request successfully added!')),
                    );
                    Navigator.pop(context); // Go back to the previous screen after adding
                  }
                },
                child: Text(
                  'Add',
                  style: GoogleFonts.openSans(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
