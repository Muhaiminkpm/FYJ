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
  List<Image> setImage = [
    Image.asset('asset/google 1.png'),
    Image.asset('asset/dribbble 1.png'),
    Image.asset('asset/google 1.png'),
    Image.asset('asset/dribbble 1.png')
  ];
  List<dynamic> chooseCategary = [
    'Senior designer',
    'Designer',
    'Full-time',
    'Part-time',
    'Flutter developer'
  ];
  List<String> resourceTypes = [
    'UI/UX Designer',
    'Lead Designer',
    'Digital Marketing ',
    'Flutter Developer '
  ];
  List<String> companyNames = [
    "Spanixo LLP . Calicut,Kerala ",
    "Spanixo LLP . Calicut,Kerala ",
    "Spanixo LLP . Calicut,Kerala ",
    "Spanixo LLP . Calicut,Kerala ",
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
                    child:GestureDetector(
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
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: setImage[index],
                                ),
                                SizedBox(width: 250),
                                Icon(Icons.bookmark_border),
                              ],
                            ),
                            ListTile(
                              title: Text(
                                resourceTypes[index],
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text(companyNames[index]),
                              onTap: () {
                                // Handle tap on each type
                              },
                            ),
                            Container(
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
              ),
            ]),
          ),
        ));
  }
}
