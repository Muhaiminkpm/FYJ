import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  List<num> selectNum =
      List.generate(20, (int index) => index + 1); // For experience years
  num? Valuenum; // For experience start

  List<String> selectCource = [
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
  ]; // For job selection

  String? Valuechoose; // For job dropdown
  num? startExperience; // For experience start dropdown
  num? endExperience; // For experience end dropdown

  String description = ''; // To hold the description input

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
    if (startExperience != null &&
        endExperience != null &&
        startExperience! >= endExperience!) {
      showErrorMessage(
          'End experience should be greater than start experience.');
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
              Text(
                'Technology',
                style: GoogleFonts.openSans(),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                items: selectCource.map((String valueitem) {
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
                hint: Text('Select Job'),
              ),
              SizedBox(height: 20),
              Text(
                'Experience',
                style: GoogleFonts.openSans(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<num>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
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
                      hint: Text('Start'),
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between fields
                  Expanded(
                    child: DropdownButtonFormField<num>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
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
                      hint: Text('End'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: GoogleFonts.openSans(),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: 'Enter details here...',
                ),
                maxLines: 4, // Allow multiline input
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(350, 30),
                    backgroundColor: Colors.blue),
                onPressed: () {
                  if (validateForm()) {
                    // Proceed to submit form if validation passes
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request successfully added!')),
                    );
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
