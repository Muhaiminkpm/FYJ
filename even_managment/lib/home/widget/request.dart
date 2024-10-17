import 'package:even_managment/home/widget/request%20details/addrequest.dart';
import 'package:even_managment/home/widget/request%20details/fechrequest.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 // Import ResourceData

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool showMyResources = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyResources = false;
                });
              },
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'All Requests',
                    style: GoogleFonts.ubuntu(
                      color: !showMyResources ? Colors.blue : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (!showMyResources)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 2,
                      width: 150,
                      color: Colors.blue,
                    ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyResources = true;
                });
              },
              child: Column(
                children: [
                  const SizedBox(height: 22),
                  Text(
                    'My Requests',
                    style: GoogleFonts.ubuntu(
                      color: showMyResources ? Colors.blue : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (showMyResources)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 2,
                      width: 150,
                      color: Colors.blue,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: showMyResources ? ResourceData.myResources.length : ResourceData.allResources.length,
        itemBuilder: (context, index) {
          // Get the resource based on the selected list
          final resource = showMyResources ? ResourceData.myResources[index] : ResourceData.allResources[index];

          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(242, 108, 104, 106)),
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 225, 238, 244),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display Technology (Job Title)
                Text(
                  'Technology: ${resource['role']!}',
                  style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Display Experience
                Text(
                  'Experience: ${resource['experience']!}',
                  style: GoogleFonts.ubuntu(fontSize: 14),
                ),
                const SizedBox(height: 8),

                // Display Description (since this field is stored as the description in AddRequest)
                Text(
                  'Description: ${resource['description'] ?? 'No description provided'}',
                  style: GoogleFonts.ubuntu(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddRequest form when FAB is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRequest()),
          ).then((_) {
            // Refresh state when returning from AddRequest
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
