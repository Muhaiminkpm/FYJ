import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dream_jobs.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const DreamJob()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 15, 115),
      body: Padding(
        padding: const EdgeInsets.all(90),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/splash_icon.png'),
              Text(
                'Jobspot',
                style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
