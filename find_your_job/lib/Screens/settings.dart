import 'package:find_your_job/profile/profiledisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/provider.dart'; // import your provider



import 'splashsceen.dart'; // import the welcome screen

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
      'icon': Icons.dark_mode,
      'title': 'Theme Toggle',
      'subtitle': 'Toggle dark mode on/off',
      'trailing': CupertinoSwitch(
        value: false,
        onChanged: (bool value) {
          // Implement dark mode toggle functionality
        },
      ),
    },
    {
      'icon': Icons.notifications,
      'title': 'Notification Settings',
      'subtitle': 'Manage your notifications',
      'trailing': const Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.language,
      'title': 'Language',
      'subtitle': 'Change app language',
      'trailing': const Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.privacy_tip,
      'title': 'Privacy',
      'subtitle': 'Manage privacy settings',
      'trailing': const Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.security,
      'title': 'Security',
      'subtitle': 'Adjust security options',
      'trailing': const Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.logout,
      'title': 'Logout',
      'subtitle': 'Logout from the app',
      'trailing': const Icon(Icons.arrow_forward_ios),
      'onTap': null, // We'll set this in initState
    },
  ];

  @override
  void initState() {
    super.initState();
    // Set the onTap function for the profile item
    itemSettings[0]['onTap'] = () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileDisplay()),
      );
    };
    // Set the onTap function for the logout item
    itemSettings.last['onTap'] = () => _confirmLogout(context);
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
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Logout"),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                final loginState =
                    Provider.of<LoginState>(context, listen: false);
                loginState.setLoggedIn(false); // Update login state
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
            onTap: itemSettings[index]['onTap'], // Trigger respective actions
          );
        },
      ),
    ));
  }
}
