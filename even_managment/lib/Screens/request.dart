// File: request_screen.dart
import 'package:even_managment/home/Deatails%20Screens/request%20details/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:even_managment/home/Deatails%20Screens/request%20details/addrequest.dart';
import 'package:even_managment/home/Deatails%20Screens/request%20details/fechrequest.dart'; // Import RequestData
 // Import DetailEmploye

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool showMyRequest = false;

  @override
  void initState() {
    super.initState();
    _loadRequestData();
  }

  Future<void> _loadRequestData() async {
    await RequestData.loadRequests();
    setState(() {});
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
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyRequest = false;
                });
              },
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'All Requests',
                    style: GoogleFonts.ubuntu(
                      color: !showMyRequest ? Colors.blue : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (!showMyRequest)
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
                  showMyRequest = true;
                });
              },
              child: Column(
                children: [
                  const SizedBox(height: 22),
                  Text(
                    'My Requests',
                    style: GoogleFonts.ubuntu(
                      color: showMyRequest ? Colors.blue : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  if (showMyRequest)
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
        itemCount: showMyRequest
            ? RequestData.myRequest.length
            : RequestData.allRequest.length,
        itemBuilder: (context, index) {
          final resource = showMyRequest
              ? RequestData.myRequest[index]
              : RequestData.allRequest[index];

          return GestureDetector(
            onTap: () {
              // Pass the selected request (resource) to DetailEmploye screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailEmploye(resource: resource),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(242, 108, 104, 106)),
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 225, 238, 244),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${resource['role']!}',
                    style: GoogleFonts.ubuntu(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ' ${resource['experience']!}',
                    style: GoogleFonts.ubuntu(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ' ${resource['description'] ?? 'No description provided'}',
                    style: GoogleFonts.ubuntu(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRequest()),
          ).then((_) {
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
