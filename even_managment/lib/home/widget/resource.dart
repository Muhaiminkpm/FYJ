import 'package:even_managment/home/widget/resource%20details/addresource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
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
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'All Resource',
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
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'My Resource',
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
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(242, 108, 104, 106)),
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 225, 238, 244)),
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
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Resume action
                },
                child: const Text(
                  'Resume',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddResource()));
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
