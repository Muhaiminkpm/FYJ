import 'package:find_your_job/NoUse/resource.dart';
import 'package:find_your_job/Screen/profile_display.dart';
import 'package:find_your_job/profile/profile.dart';

import '../Screen/Job_save.dart';
import '../Screen/connection_others.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screen/home1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const ConnectOther(),
    const ProfileDisplay(),
    const SelectJob(),
    const SaveJob(),
  ];
  final List<String> titles = [
    'Home',
    'Connections',
    'Add Profile',
    'My jobs',
    'Save job',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: Column(children: [
          const SizedBox(width: 300),
          Text(
            'FYJ',
            style: GoogleFonts.ubuntu(),
          ),
        ]),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notification_add)),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Image.asset('asset/home.png', color: Colors.black),
              label: 'Home'),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset(
              'asset/connections.png',
              color: Colors.black,
            ),
            label: 'Conne',
          ),
          const BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: CircleAvatar(
                child: Icon(Icons.add),
              ),
              label: "Add Profile"),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Image.asset('asset/messsage.png', color: Colors.black),
              label: "Massage"),
          BottomNavigationBarItem(
              icon: Image.asset('asset/booksmart.png', color: Colors.black),
              label: "Save Job")
        ],
      ),
    );
  }
}
