import 'package:find_your_job/Search%20Locality/search_locality.dart';

import '../Api/job_api.dart';
import '../Search Job/jobsearch.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/model.dart';
// Import the screen you want to navigate to

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late Future<JobCategoriesResponse> displayJob;

  @override
  void initState() {
    super.initState();
    displayJob = fetchJob();
  }
  bool showMyResources = false;
  Image setImage = Image.asset('asset/google 1.png');
  List<dynamic> chooseCategary = [
    'Senior designer',
    'Designer',
    'Full-time',
    'Part-time',
    'Flutter developer'
  ];
  
  String companyNames = "Spanixo LLP . Calicut,Kerala ";
  

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
                        child: const Row(
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
                                    const SearchLocation()), // Replace with your target screen
                          );
                        },
                        child: const Row(
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
                Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: chooseCategary.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 208, 201, 201),
                              borderRadius: BorderRadius.circular(5)),
                          width: chooseCategary[index].length * 10.0,
                          child: Center(child: Text(chooseCategary[index])),
                        ),
                      );
                    },
                  ),
                ),
            
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
                  // FutureBuilder<JobCategoriesResponse>(
                  //   future: futureJob,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return Center(
                  //         child: Text('${snapshot.error}'),
                  //       );
                  //     } else if (!snapshot.hasData ||
                  //         snapshot.data!.results.isEmpty) {
                  //       return const Center(
                  //         child: Text('No job categories found'),
                  //       );
                  //     }
                 
                
                
                
                
                
                SingleChildScrollView(
                  child: Column(
                    children: [
                        FutureBuilder<JobCategoriesResponse>(
             
                    future: displayJob,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData ||
                          snapshot.data!.results.isEmpty) {
                        return const Center(
                          child: Text('No job categories found'),
                        );
                      }
                      
                     return Center(
                        child: ListView.builder(
                                     physics: NeverScrollableScrollPhysics(),     
                          shrinkWrap: true,
                          itemCount: snapshot.data!.results.length,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            child: setImage,
                                          ),
                                          const SizedBox(width: 250),
                                          Icon(Icons.bookmark_border),
                                        ],
                                      ),
                                      ListTile(
                                        title: Text(
                                          snapshot.data!.results[index].label,
                                          style: GoogleFonts.aBeeZee(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(companyNames),
                                        onTap: () {
                                          // Handle tap on each type
                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: chooseCategary.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        247, 251, 249, 249),
                                                    borderRadius:
                                                        BorderRadius.circular(5)),
                                                width:
                                                    chooseCategary[index].length * 10.0,
                                                child: Center(
                                                    child: Text(chooseCategary[index])),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                     );
                     
                  },
            
                        ),
                  
                    ],
                  ),
                ),
              ]),
            ),
          ),
    );
  }
}
