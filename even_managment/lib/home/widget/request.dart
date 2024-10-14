import 'package:even_managment/home/widget/request%20details/addrequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool showMyResources = false; // Track which resource type is shown

  final List<Map<String, String>> allResources = [
    {
      "name": "John Deo",
      "experience": "5+ Years of Exp.",
      "role": "Graphic Designer",
      "contact": "+91 88665 88665"
    },
    {
      "name": "Mark Johnson",
      "experience": "7+ Years of Exp.",
      "role": "Graphic Designer",
      "contact": "+91 88665 88665"
    },
    {
      "name": "Devid Anderson",
      "experience": "7+ Years of Exp.",
      "role": "Graphic Designer",
      "contact": "+91 88665 88665"
    },
  ];

  final List<Map<String, String>> myResources = [
    {
      "name": "Mark Johnson",
      "experience": "7+ Years of Exp.",
      "role": "Graphic Designer",
      "contact": "+91 88665 88665"
    },
    {
      "name": "Devid Anderson",
      "experience": "7+ Years of Exp.",
      "role": "Graphic Designer",
      "contact": "+91 88665 88665"
    },
  ];

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
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'All Request',
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
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    'My Request',
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
        itemCount: showMyResources ? myResources.length : allResources.length,
        itemBuilder: (context, index) {
          final resource =
              showMyResources ? myResources[index] : allResources[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(resource['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(resource['experience']!),
                  const SizedBox(height: 4),
                  Text(resource['role']!),
                  const SizedBox(height: 4),
                  Text(resource['contact']!),
                ],
              ),
              // trailing: ElevatedButton(
              //   onPressed: () {
              //     // Resume action
              //   },
              //   child: const Text('Resume'),
              // ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddRequest()));
          // Add new resource action
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
