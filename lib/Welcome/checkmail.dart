import 'package:find_your_job/Welcome/login.dart';
import 'package:find_your_job/Welcome/successfully.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgetpassword.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({super.key});

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Check Your Email ',
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
                UseElevated(name: 'OPEN YOUR EMAIL',onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>VerifySucces()));
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