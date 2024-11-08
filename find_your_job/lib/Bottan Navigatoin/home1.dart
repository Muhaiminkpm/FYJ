import 'package:find_your_job/Search%20Job/jobsearch.dart';
import 'package:find_your_job/Search%20Locality/searchlocality.dart';
import 'package:flutter/material.dart';
// Import the screen you want to navigate to

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMyResources = false;// Track which resource type is shown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(221, 145, 140, 140),
                blurRadius: 20,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the desired screen when the first row is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const JobSearch()), // Replace with your target screen
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Job title, keyword, or company',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    // Navigate to the desired screen when the second row is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchLocation()), // Replace with your target screen
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Enter city or locality',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
