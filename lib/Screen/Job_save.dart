import 'package:flutter/material.dart';

class SelectJob extends StatefulWidget {
  const SelectJob({super.key});

  @override
  State<SelectJob> createState() => _SelectJobState();
}

class _SelectJobState extends State<SelectJob> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Save Job'),
      ),
    );
  }
}