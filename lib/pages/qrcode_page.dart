import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'login_page.dart';

class QRcodePage extends StatefulWidget {
  @override
  _QRcodePageState createState() => _QRcodePageState();
}

class _QRcodePageState extends State<QRcodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LoginPage(
              userName: scanData.code.split("\n")[0],
              password: scanData.code.split("\n")[1],
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/qr.png",
              height: 500,
              width: 500,
            ),
          ),
        ],
      ),
    );
  }
}
