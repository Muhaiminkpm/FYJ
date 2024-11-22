import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Update Password",
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
