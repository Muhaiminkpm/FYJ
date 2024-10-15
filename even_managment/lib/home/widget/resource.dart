import 'package:even_managment/home/widget/resource%20details/addresource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  bool showMyResources = false;

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTab('All Resources', !showMyResources),
            buildTab('My Resources', showMyResources),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: showMyResources ? myResources.length : allResources.length,
        itemBuilder: (context, index) {
          final resource =
              showMyResources ? myResources[index] : allResources[index];
          return buildResourceTile(resource);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddResource()));
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Helper widget to build each tab
  Widget buildTab(String title, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showMyResources = title == 'My Resources';
        });
      },
      child: Column(
        children: [
          const SizedBox(height: 22),
          Text(
            title,
            style: GoogleFonts.ubuntu(
              color: isActive ? Colors.blue : Colors.black,
              fontSize: 18,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 2),
              height: 2,
              width: 150,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  // Helper widget to build resource tile
  Widget buildResourceTile(Map<String, String> resource) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(242, 108, 104, 106)),
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 225, 238, 244),
      ),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(resource['name'] ?? 'Unknown',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Resume action
                  },
                  child: const Text('Resume',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            Text(resource['experience'] ?? 'N/A'),
            const Divider(thickness: 1),
            Row(
              children: [
                const Icon(Icons.tv),
                const SizedBox(width: 4),
                Text(resource['role'] ?? 'N/A'),
                const SizedBox(width: 20),
                const Icon(Icons.stay_current_portrait_rounded),
                Text(resource['contact'] ?? 'N/A'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
