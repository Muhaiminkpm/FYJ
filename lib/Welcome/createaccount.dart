import 'package:find_your_job/Welcome/forgetpassword.dart';
import 'package:find_your_job/Welcome/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create an Account ',
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('''       Lorem ipsum dolor sit amet, consectetur    
              adipiscing  elit, sed do eiusmod tempor'''),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Full Name',
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
                  UseGestureDetector(
                    itemColor: Colors.black,
                      name: 'Forget Password',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()));
                      })
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 UseElevated(name: 'SIGN UP', onPressed: (){},
                 selectColor: const Color.fromARGB(255, 18, 15, 115),),
                  SizedBox(
                    height: 20,
                  ),
                  UseElevated(name: 'SIGN WITH GOOGLE', onPressed: (){},
                  selectColor:  const Color.fromARGB(255, 18, 15, 115),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text('You dont have an account yet?  '),
                      UseGestureDetector(
                        itemColor: Colors.orange,
                          name: 'Sign in',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          })
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
