import 'package:find_your_job/Settings/settings.dart';
import 'package:find_your_job/Welcome/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(239, 255, 255, 255),

      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update Password",
              style: GoogleFonts.aBeeZee(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20),
            Text('Old Password'),
            SizedBox(height: 10),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                       
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('New Password'),
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
                    SizedBox(height: 10),
                    Text('Confirm Password'),
                    SizedBox(height: 10),
                     TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                       
                      ),
                    )
                  ],
                )),
                SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   UseElevated(name:'UPDATE', onPressed: (){
                     Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SettingsScreen()));
   
                   }, selectColor: const Color.fromARGB(255, 18, 15, 115))
                  ],
                )
          ],
        ),
      ),
    );
  }
}
