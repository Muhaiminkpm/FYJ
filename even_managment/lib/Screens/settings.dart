import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<dynamic> itemSettings = [
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
      'trailing': Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.language,
      'title': 'Language',
      'subtitle': 'Change app language',
      'trailing': Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.privacy_tip,
      'title': 'Privacy',
      'subtitle': 'Manage privacy settings',
      'trailing': Icon(Icons.arrow_forward_ios),
    },
    {
      'icon': Icons.security,
      'title': 'Security',
      'subtitle': 'Adjust security options',
      'trailing': Icon(Icons.arrow_forward_ios),
    },
  ];
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
          );
        },
      ),
    ));
  }
}
