import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'qrcode_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 350,
              ),
              const SizedBox(height: 10),
              Text(
                "Tap to Login...",
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
