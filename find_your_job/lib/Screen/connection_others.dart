import 'package:flutter/material.dart';

class ConnectOther extends StatefulWidget {
  const ConnectOther({super.key});

  @override
  State<ConnectOther> createState() => _ConnectOtherState();
}

class _ConnectOtherState extends State<ConnectOther> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('connect Others'),
      ),
    );
  }
}