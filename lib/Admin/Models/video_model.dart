import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoModel extends StatefulWidget {
  late final String videoId;
  late final String videoUrl;
  late final String description;

  videoModel({
    required this.videoId,
    required this.videoUrl,
    required this.description,
  });

  factory videoModel.fromDocument(DocumentSnapshot doc) {
    return videoModel(
      videoId:
          doc.data().toString().contains('videoId') ? doc.get('videoId') : '',
      videoUrl:
          doc.data().toString().contains('videoUrl') ? doc.get('videoUrl') : '',
      description: doc.data().toString().contains('description')
          ? doc.get('description')
          : '',
    );
  }

  @override
  State<videoModel> createState() => _videoModelState(
        videoId: this.videoId,
        videoUrl: this.videoUrl,
        description: this.description,
      );
}

class _videoModelState extends State<videoModel> {
  late final String videoId;
  late final String videoUrl;
  late final String description;

  late VideoPlayerController vidController;

  void initState() {
    super.initState();
    vidController = VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => vidController.play());
    setState(() {});
  }

  void dispose() {
    super.dispose();
    vidController.dispose();
  }

  _videoModelState({
    required this.videoId,
    required this.videoUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) =>
      vidController != null && vidController.value.isInitialized
          ? Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 330,
                    child: VideoPlayer(vidController),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(""),
            );
}
