import 'update_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Welcome/splash_sceen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Logout"),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

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
                'Settings',
                style: GoogleFonts.aBeeZee(
                    fontSize: 20, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.notifications),
                title: Text('Notification '),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.dark_mode),
                title: Text('Dark mode'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.lock),
                title: Text('Password'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                trailing: Icon(Icons.chevron_right_sharp),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordUpdate()));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                trailing: Icon(Icons.chevron_right_sharp),
                onTap: () {
                  _confirmLogout(context);
                },
              ),

              // ListView.builder(
              //             itemCount: itemSettings.length,
              //             itemBuilder: (context, index) {
              //               return ListTile(
              //                 leading: Icon(itemSettings[index]['icon']),
              //                 title: Text(itemSettings[index]['title']),
              //                 subtitle: Text(itemSettings[index]['subtitle']),
              //                 trailing: itemSettings[index]['trailing'],
              //                 onTap: itemSettings[index]['onTap'],
              //               );
              //             },
              // ),
            ],
          ),
        ));
  }
}
