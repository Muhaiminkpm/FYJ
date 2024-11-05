import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/splashsceen.dart';
import 'package:find_your_job/profile/profiledisplay.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<dynamic> itemSettings = [
    {
      'icon': Icons.account_circle,
      'title': 'Profile',
      'subtitle': 'View and edit your profile',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
      'subtitle': 'View and edit your settings',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.dark_mode,
      'title': 'Dark Mode',
      'subtitle': 'Toggle dark/light theme',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.notifications,
      'title': 'Notifications',
      'subtitle': 'Manage your notification preferences',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.security,
      'title': 'Privacy & Security',
      'subtitle': 'Control your privacy settings',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.color_lens,
      'title': 'Appearance',
      'subtitle': 'Customize app theme and display',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.language,
      'title': 'Language',
      'subtitle': 'Change app language',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.help_outline,
      'title': 'Help & Support',
      'subtitle': 'Get help and contact support',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
    {
      'icon': Icons.logout,
      'title': 'Logout',
      'subtitle': 'Logout from the app',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    itemSettings[0]['onTap'] = () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileDisplay()),
      );
    };

    itemSettings[8]['onTap'] = () => _confirmLogout(context);
  }

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
        body: Container(
      height: double.infinity,
      width: 200,
      color: Colors.grey,
      child: ListView.builder(
        itemCount: itemSettings.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(itemSettings[index]['icon']),
            title: Text(itemSettings[index]['title']),
            subtitle: Text(itemSettings[index]['subtitle']),
            trailing: itemSettings[index]['trailing'],
            onTap: itemSettings[index]['onTap'],
          );
        },
      ),
    ));
  }
}
