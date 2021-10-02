import 'package:flutter/material.dart';
import 'qrcode_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return QRcodePage();
            },
          ),
        );
      },
      child: const Scaffold(
        body: Center(
          child: Text("Tap to Login"),
        ),
      ),
    );
  }
}
