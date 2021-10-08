import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_lnct/widgets/live_tab/audio_player.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: const Text(
                "LNCT RADIO",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 50, right: 50),
              child: SizedBox(
                child: Image.asset(
                  "assets/images/live_cover_1.jpg",
                  // width: 250,
                  // height: 250,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: const Text(
                "Khushboo Gupta - SDE at Google",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: const Text(
                "Hosted by Ankul Kumar Singh",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const MyAudioPlayer(),
            const SizedBox(
              height: 53,
            ),
            Lottie.network(
              "https://assets5.lottiefiles.com/packages/lf20_6jfc4gby.json",
              // height: 95,
              // width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
