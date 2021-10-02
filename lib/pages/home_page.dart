import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String accessToken;
  final String refreshToken;

  HomePage(
      {required this.name,
      required this.accessToken,
      required this.refreshToken});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome! ${widget.name}",
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
