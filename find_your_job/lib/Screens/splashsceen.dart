import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dreamjobs.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const DreamJob()));
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 117, 176),
      body: Padding(
        padding: const EdgeInsets.all(90),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Find Your',
                style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Image.asset('asset/job icon.png')
            ],
          ),
        ),
      ),
    );
  }
}
