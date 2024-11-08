import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Bottan Navigatoin/home1.dart';
import '../Bottan Navigatoin/request.dart';
import '../Bottan Navigatoin/resource.dart';
import '../Bottan Navigatoin/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const RequestScreen(),
    const ResourceScreen(),
    const SettingsScreen(),
  ];
  final List<String> titles = [
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
        leading: const Icon(Icons.menu),
        title: Column(children: [
          const SizedBox(width: 300),
          Text(
            titles[_currentIndex],
            style: GoogleFonts.ubuntu(),
          ),
        ]),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notification_add)
          ),
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
