import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_lnct/widgets/live_tab/audio_player.dart';

class AudioScreen extends StatefulWidget {
  late final String title;
  late final String host;
  late final String interviewId;
  late final String mediaUrl;
  late final String coverPicUrl;

  AudioScreen({
    required this.title,
    required this.host,
    required this.interviewId,
    required this.mediaUrl,
    required this.coverPicUrl,
  });

  factory AudioScreen.fromDocument(DocumentSnapshot doc) {
    return AudioScreen(
      title: doc['title'],
      host: doc['host'],
      interviewId: doc['interviewId'],
      mediaUrl: doc['mediaUrl'],
      coverPicUrl: doc['coverPicUrl'],
    );
  }

  @override
  State<AudioScreen> createState() => _AudioScreenState(
        title: this.title,
        host: this.host,
        interviewId: this.interviewId,
        mediaUrl: this.mediaUrl,
        coverPicUrl: this.coverPicUrl,
      );
}

class _AudioScreenState extends State<AudioScreen> {
  late final String title;
  late final String host;
  late final String interviewId;
  late final String mediaUrl;
  late final String coverPicUrl;

  _AudioScreenState({
    required this.title,
    required this.host,
    required this.interviewId,
    required this.mediaUrl,
    required this.coverPicUrl,
  });

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
                child: Image.network(
                  coverPicUrl,
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
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                host,
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
              audioUrl: mediaUrl,
            ),
            const SizedBox(
              height: 53,
            ),
            // Lottie.network(
            //   "https://assets5.lottiefiles.com/packages/lf20_6jfc4gby.json",
            //   // height: 95,
            //   // width: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
