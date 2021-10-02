import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final String userName;
  final String password;
  const LoginPage({required this.userName, required this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = true;

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
    if (response.statusCode == 200) {
      final accessToken = jsonDecode(response.body)["access_token"].toString();
      final refreshToken =
          jsonDecode(response.body)["refresh_token"].toString();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return HomePage(
                name: widget.userName,
                accessToken: accessToken,
                refreshToken: refreshToken);
          },
        ),
      );
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: loading
              ? const CupertinoActivityIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/warning.png",
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Login Failed...",
                      style: GoogleFonts.notoSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
