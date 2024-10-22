import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailEmploye extends StatefulWidget {
  final Map<String, dynamic> resource; // Receiving resource data

  const DetailEmploye({super.key, required this.resource});

  @override
  State<DetailEmploye> createState() => _DetailEmployeState();
}

class _DetailEmployeState extends State<DetailEmploye> {
  bool showMyDetails = true; // Toggle between "Details" and "Match"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120, // Set specific AppBar height
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyDetails = true;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.resource['role']}'),
                  const SizedBox(height: 20), // Keep this SizedBox
                  Text(
                    'Details',
                    style: GoogleFonts.ubuntu(
                      color: showMyDetails ? Colors.blue : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (showMyDetails)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 2,
                      width: 150,
                      color: Colors.blue,
                    ),
                ],
              ),
            ),

            // Add space between the two sections (Details and Match)
            // Adjust the width as needed

            GestureDetector(
              onTap: () {
                setState(() {
                  showMyDetails = false;
                });
              },
              child: Column(
                children: [
                  const SizedBox(
                      height: 20), // Optional for spacing consistency
                  Text(
                    'Match',
                    style: GoogleFonts.ubuntu(
                      color: !showMyDetails ? Colors.blue : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (!showMyDetails)
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
      body: showMyDetails ? _buildDetails() : _buildMatch(),
    );
  }

  Widget _buildDetails() {
    // Show the detailed information of the resource
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' ${widget.resource['role']}',
            style:
                GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            ' ${widget.resource['experience']}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            ' ${widget.resource['description'] ?? 'No description provided'}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildMatch() {
    // Show the match information of the resource
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Matching Skills:',
            style:
                GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Add the logic to display matched skills or similar information
          Text(
            'Skill 1: ${widget.resource['matchSkill1'] ?? 'N/A'}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            'Skill 2: ${widget.resource['matchSkill2'] ?? 'N/A'}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
