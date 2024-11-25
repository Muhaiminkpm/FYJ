import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailEmploye extends StatefulWidget {
  final Map<String, dynamic> resource;

  const DetailEmploye({super.key, required this.resource});

  @override
  State<DetailEmploye> createState() => _DetailEmployeState();
}

class _DetailEmployeState extends State<DetailEmploye> {
  bool showMyDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120,
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
                  Text(widget.resource['company'] ?? ''),
                  const SizedBox(height: 20),
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
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyDetails = false;
                });
              },
              child: Column(
                children: [
                  const SizedBox(height: 20),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.resource['role'] ?? '',
            style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            widget.resource['company'] ?? '',
            style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            widget.resource['location'] ?? '',
            style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          Text(
            'Job Type: ${widget.resource['experience'] ?? ''}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Posted: ${widget.resource['date_posted'] ?? ''}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
          const SizedBox(height: 24),
          Text(
            'Description:',
            style: GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            widget.resource['description'] ?? 'No description provided',
            style: GoogleFonts.ubuntu(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildMatch() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job Requirements:',
            style: GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Add your matching criteria here
          Text(
            'Experience Level: ${widget.resource['experience'] ?? 'Not specified'}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Location: ${widget.resource['location'] ?? 'Not specified'}',
            style: GoogleFonts.ubuntu(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
