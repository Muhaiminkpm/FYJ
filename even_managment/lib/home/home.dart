
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/home1.dart';
import '../Screens/request.dart';
import '../Screens/resource.dart';
import '../Screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> Pages = [
    const HomeScreen(),
    const RequestScreen(),
    const ResourceScreen(),
    const SettingsScreen(),
  ];
  List titles = [
    'Home',
    'Request',
    'Resource',
    'Settings',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        // actions: [
        //   Row(
        //     children: [
        //       const Icon(Icons.abc),
        //       // const SizedBox(width: 10),
        //       Text(titles[_currentIndex]),
        //       // const SizedBox(width: 10),
        //       const Icon(Icons.abc),
        //     ],
        //   ),

        // ],
        leading: const Icon(Icons.menu),

        title: Column(children: [
          const SizedBox(
            width: 300,
          ),
          Text(
            titles[_currentIndex],
            style: GoogleFonts.ubuntu(),
          ),
        ]),

        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notification_add)),
        ],
      ),
      body: Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.edit_note,
              color: Colors.black,
            ),
            label: 'Request',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.category),
              label: "Resource"),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.settings),
              label: "Settings"),
        ],
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
