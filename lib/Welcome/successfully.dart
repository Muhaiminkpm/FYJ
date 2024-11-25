import 'package:find_your_job/Welcome/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home.dart';
import 'forgetpassword.dart';

class VerifySucces extends StatefulWidget {
  const VerifySucces({super.key});

  @override
  State<VerifySucces> createState() => _VerifySuccesState();
}

class _VerifySuccesState extends State<VerifySucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Successfully',
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('''       Lorem ipsum dolor sit amet, consectetur    
            adipiscing  elit, sed do eiusmod tempor'''),
                const SizedBox(
                  height: 30,
                ),
                Image.asset('asset/check email.png'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UseElevated(name: 'CONTINUE',onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                selectColor: const Color.fromARGB(255, 18, 15, 115),),
                SizedBox(
                  height: 20,
                ),
                //Update button
                UseElevated(name: 'BACK TO LOGIN', onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>LoginScreen()));
                },
                selectColor: const Color.fromARGB(255, 18, 15, 115),),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text('You dont have an account yet?  '),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}