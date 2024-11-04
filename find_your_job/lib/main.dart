import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/provider.dart';
import 'Screens/splashsceen.dart';
import 'home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
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
    Future.microtask(() {
      Provider.of<LoginState>(context, listen: false).loadLoginState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(
      builder: (context, loginState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: loginState.isLoggedIn ? const HomePage() : const WelcomeScreen(),
        );
      },
    );
  }
}
