import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                  'WELCOME BACK',
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
            Image.asset('asset/forget password.png'),
              ],
            ),
            
             const SizedBox(
              height: 30,
            ),
            Text(
              'Email',
              style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Password',
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Remember me'),
                SizedBox(
                  width: 70,
                ),
                Text(
                  'Forget Password ?',
                  style: GoogleFonts.aBeeZee(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: GoogleFonts.aBeeZee(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: const Color.fromARGB(255, 18, 15, 115),
                    fixedSize: const Size(300, 50), // Set width and height
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'UPDATE',
                    style: GoogleFonts.aBeeZee(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: const Color.fromARGB(255, 18, 15, 115),
                    fixedSize: const Size(300, 50),
                  ),

                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Text('You dont have an account yet?  '),
                    GestureDetector(
                      
                      child: Text('Sign on',
                      style: GoogleFonts.abel(
                        color: Colors.blue
                      ),),
                      )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}