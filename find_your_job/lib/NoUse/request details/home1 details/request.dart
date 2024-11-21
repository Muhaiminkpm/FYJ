import 'package:flutter/material.dart';

class HomeReguest extends StatefulWidget {
  const HomeReguest({super.key});

  @override
  State<HomeReguest> createState() => _HomeReguestState();
}

class _HomeReguestState extends State<HomeReguest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text('Home Request',),
        ),
    );
  }
}