import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_lnct/widgets/live_tab/audio_player.dart';

class AudioScreen extends StatefulWidget {
  final title;
  final host;
  final imageAsset;
  final audioAsset;

  const AudioScreen(
      {Key? key,
      required this.title,
      required this.host,
      required this.imageAsset,
      required this.audioAsset})
      : super(key: key);

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
                  widget.imageAsset,
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
              child: Text(
                widget.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                widget.host,
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
            MyAudioPlayer(
              audioAsset: widget.audioAsset,
            ),
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
