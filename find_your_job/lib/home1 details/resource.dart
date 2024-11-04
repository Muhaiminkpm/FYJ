import 'package:flutter/material.dart';

class HomeResource extends StatefulWidget {
  const HomeResource({super.key});

  @override
  State<HomeResource> createState() => _HomeResourceState();
}

class _HomeResourceState extends State<HomeResource> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Resource'),
      ),
    );
  }
}