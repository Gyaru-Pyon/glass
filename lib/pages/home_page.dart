import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:http/http.dart' as http;
import '../classes/emotion.dart';

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
  List<Emotion> emotions = [
    Emotion(color: const Color(0xAAFFCC00), name: "Joy", score: 0.2),
    Emotion(color: const Color(0xAAFF3B30), name: "Anger", score: 0.3),
    Emotion(color: const Color(0xAAAF52DE), name: "Fear", score: 0.3),
    Emotion(color: const Color(0xAA5856D6), name: "Sadness", score: 0.5),
    Emotion(color: const Color(0xAAFF9500), name: "Confidence", score: 0.8),
    Emotion(color: const Color(0xAA5AC8FA), name: "Tentative", score: 1.0),
  ];

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 10),
      _fetchCurrentEmotions,
    );
    Timer.periodic(
      const Duration(minutes: 10),
      _fetchVoice,
    );
    emotions.sort((a, b) => a.score.compareTo(b.score));
    super.initState();
  }

  void _fetchCurrentEmotions(Timer timer) async {
    var url = Uri.parse('https://gyaru-pyon.mizucoffee.net/api/emotions');
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${widget.accessToken}"});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> rawEmotions =
          Map.from(json.decode(response.body)["emotions"]);
      print(rawEmotions);
      for (Emotion emotionData in emotions) {
        if (rawEmotions.containsKey(emotionData.name.toLowerCase())) {
          emotions
                  .where(
                      (element) =>
                          element.name.toLowerCase() ==
                          emotionData.name.toLowerCase())
                  .first
                  .score =
              double.parse(
                  rawEmotions[emotionData.name.toLowerCase()].toString());
        } else {
          emotions
              .where((element) =>
                  element.name.toLowerCase() == emotionData.name.toLowerCase())
              .first
              .score = 0.0;
        }
      }
      setState(() {
        emotions.sort((a, b) => a.score.compareTo(b.score));
      });
      print(emotions);
    }
  }

  void _fetchVoice(Timer timer) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressEnd: (_) {
        int count = 0;
        Navigator.popUntil(context, (_) => count++ >= 3);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            WaveWidget(
              config: CustomConfig(
                colors: [emotions[0].color],
                durations: [29000],
                heightPercentages: [0.10],
                blur: const MaskFilter.blur(BlurStyle.solid, 10),
              ),
              waveFrequency: emotions[0].score + 1.0,
              backgroundColor: Colors.transparent,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                colors: [emotions[1].color],
                durations: [22000],
                heightPercentages: [0.25],
                blur: const MaskFilter.blur(BlurStyle.solid, 10),
              ),
              backgroundColor: Colors.transparent,
              waveAmplitude: 100.0,
              waveFrequency: emotions[1].score + 1.0,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                colors: [emotions[2].color],
                durations: [19000],
                heightPercentages: [0.40],
                blur: const MaskFilter.blur(BlurStyle.solid, 10),
              ),
              backgroundColor: Colors.transparent,
              waveAmplitude: 80.0,
              waveFrequency: emotions[2].score + 1.0,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                colors: [emotions[3].color],
                durations: [14000],
                heightPercentages: [0.55],
                blur: const MaskFilter.blur(BlurStyle.solid, 10),
              ),
              backgroundColor: Colors.transparent,
              waveAmplitude: 65.0,
              waveFrequency: emotions[3].score + 1.0,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                colors: [emotions[4].color],
                durations: [12000],
                heightPercentages: [0.70],
                blur: const MaskFilter.blur(BlurStyle.solid, 10),
              ),
              backgroundColor: Colors.transparent,
              waveAmplitude: 55.0,
              waveFrequency: emotions[4].score + 1.0,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                colors: [emotions[5].color],
                durations: [10000],
                heightPercentages: [0.85],
                blur: const MaskFilter.blur(BlurStyle.solid, 10),
              ),
              backgroundColor: Colors.transparent,
              waveAmplitude: 30.0,
              waveFrequency: emotions[5].score,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
