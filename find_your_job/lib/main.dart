import 'package:find_your_job/DarkMode/darkmode.dart';
import 'package:find_your_job/Provider/provider.dart';
import 'package:find_your_job/Screens/splashsceen.dart';
import 'package:find_your_job/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      home: userProvider.isLoggedIn ? const HomePage() : const WelcomeScreen(),
    );
  }
}
