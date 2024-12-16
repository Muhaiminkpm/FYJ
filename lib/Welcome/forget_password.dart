import 'package:find_your_job/Welcome/check_mail.dart';
import 'package:find_your_job/Welcome/login.dart';
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
                SizedBox(height: 70),
                Text(
                  'Forget Password?',
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('''       Lorem ipsum dolor sit amet, consectetur    
            adipiscing  elit, sed do eiusmod tempor'''),
                const SizedBox(
                  height: 60,
                ),
                Image.asset('asset/forget password.png'),
              ],
            ),
            const SizedBox(
              height: 60,
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
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UseElevated(name: 'RESET PASSWORD',onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const CheckMail()));
                    },
                selectColor: const Color.fromARGB(255, 18, 15, 115),),
                SizedBox(
                  height: 20,
                ),
                //Update button
                UseElevated(name: 'BACK TO LOGIN', onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                selectColor: const Color.fromARGB(255, 155, 153, 213),),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UseElevated extends StatelessWidget {
  const UseElevated({
    
    required this.name,
    required this.onPressed,
    required this.selectColor,
  });
  
  final Color selectColor;
  final String name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     
      onPressed: onPressed,
      child: Text(name, style: GoogleFonts.aBeeZee(
        color: Colors.white
      ),),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: selectColor,
        fixedSize: const Size(300, 50),
      ),
    );
  }
}

class UseGestureDetector extends StatelessWidget {
  const UseGestureDetector({
    super.key,
    required this.name,
    required this.onTap,
    required this.itemColor,
  });
  final String name;
  final Function() onTap;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        name,
        style: GoogleFonts.abel(color: itemColor),
      ),
      onTap: onTap,
    );
  }
}
