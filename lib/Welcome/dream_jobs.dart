
import 'package:find_your_job/Welcome/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DreamJob extends StatefulWidget {
  const DreamJob({super.key});

  @override
  State<DreamJob> createState() => _DreamJobState();
}

class _DreamJobState extends State<DreamJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Stack(children: [
              Image.asset(
                'asset/Vector.png',
              ),
              Image.asset('asset/searchjob.png')
            ]),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Your ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Dream Job',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    'Here!',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text('''Explore all the most exiciting job roles
 on your intrest and study major.''')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 40, 6, 94),
                  radius: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
