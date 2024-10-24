import 'package:even_managment/Screens/splashsceen.dart';
import 'package:even_managment/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/provider.dart'; // Import your provider
 // Import home screen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginState(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    final loginState = Provider.of<LoginState>(context, listen: false);
    loginState.loadLoginState(); // Load the login state from shared preferences
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, loginState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              loginState.isLoggedIn ? const HomePage() : const WelcomeScreen(),
        );
      },
    );
  }
}
