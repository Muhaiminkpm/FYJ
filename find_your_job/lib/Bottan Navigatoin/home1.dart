import 'package:find_your_job/Search%20Job/jobsearch.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Import the screen you want to navigate to

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMyResources = false;
  List<String> resourceTypes = [
    'Flutter Developer',
    'Flutter Developer Intern',
    'Laravel,Flutter,Digital Marketing ',
    'Flutter Developer '
  ];
  List<String> companyNames = [
    '''Spanixo LLP
Ramanattukara,Calicut,Kerala ''',
    '''Spanixo LLP
Ramanattukara,Calicut,Kerala ''',
    '''Spanixo LLP
Ramanattukara,Calicut,Kerala ''',
    '''Spanixo LLP
Ramanattukara,Calicut,Kerala ''',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Stack(children: [
                Image.asset('asset/search background.png'),
                Positioned(
                  left: 30,
                  right: 30,
                  height: 30,
                  top: 120,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the desired screen when the container is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const JobSearch()), // Replace with your target screen
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Text('Specialization'),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                Positioned(
                  left: 30,
                  right: 30,
                  height: 30,
                  bottom: 90,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the desired screen when the container is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const JobSearch()), // Replace with your target screen
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.location_on),
                          SizedBox(width: 10),
                          Text('Malappuram, Kerala'),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ]),
              //single child sroll veiw , card - horizondal
              // Text(
              //   'Jobs for you ',
              //   style:
              //       GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 10),
              // Text(
              //   'Jobs based on your activity on Indeed ',
              //   style: GoogleFonts.aBeeZee(),
              // ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: resourceTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(221, 228, 230, 229),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                resourceTypes[index],
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text(companyNames[index]),
                              trailing: const Column(
                                children: [
                                  Icon(Icons.bookmark_border),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(Icons.block)
                                ],
                              ),
                              onTap: () {
                                // Handle tap on each type
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]),
          ),
        ));
  }
}
