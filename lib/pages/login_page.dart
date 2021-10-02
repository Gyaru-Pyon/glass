import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final String userName;
  final String password;
  const LoginPage({required this.userName, required this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    login();
  }

  void login() async {
    var url = Uri.parse(
        'https://ts-prisma-boilerplate.mizucoffee.net/api/auth/signin');
    var response = await http.post(url,
        body: {'name': widget.userName, 'password': widget.password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.userName}, ${widget.password}"),
      ),
    );
  }
}
