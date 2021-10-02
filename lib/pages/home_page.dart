import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

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
      body: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.red, const Color(0xEEF44336)],
            [Colors.red[800]!, const Color(0x77E57373)],
            [Colors.orange, const Color(0x66FF9800)],
            [Colors.yellow, const Color(0x55FFEB3B)]
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.30],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 0,
        backgroundColor: Colors.black,
        size: const Size(
          double.infinity,
          double.infinity,
        ),
      ),
    );
  }
}
