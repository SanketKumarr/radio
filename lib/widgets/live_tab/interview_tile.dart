import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/live_tab/audio_screen.dart';

//Note: Global Variables:-
// late String title;
// late String host;
// late String mediaUrl;
// late String interviewId;

class InterviewTile extends StatefulWidget {
  late final String title;
  late final String host;
  late final String mediaUrl;
  late final String interviewId;

  InterviewTile({
    // Key? key,
    required this.title,
    required this.host,
    required this.mediaUrl,
    required this.interviewId,
  });

  factory InterviewTile.fromDocument(DocumentSnapshot doc) {
    return InterviewTile(
      title: doc.data().toString().contains('title') ? doc.get('title') : '',
      host: doc.data().toString().contains('host') ? doc.get('host') : '',
      mediaUrl: doc.data().toString().contains('mediaUrl') ? doc.get('mediaUrl') : '',
      interviewId: doc.data().toString().contains('interviewId') ? doc.get('interviewId') : '',
    );
  }

  @override
  State<InterviewTile> createState() => _InterviewTileState(
        title: this.title,
        mediaUrl: this.mediaUrl,
        host: this.host,
        interviewId: this.interviewId,
      );
}

class _InterviewTileState extends State<InterviewTile> {
  late final String title;
  late final String host;
  late final String mediaUrl;
  late final String interviewId;

  _InterviewTileState({
    required this.title,
    required this.interviewId,
    required this.host,
    required this.mediaUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AudioScreen(
                title: title,
                host: host,
                mediaUrl: mediaUrl,
                interviewId: interviewId,
              ),
            ),
          );
        },
        child: ListTile(
          title: Transform.translate(
            offset: const Offset(-17, 0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "ProductSans",
                color: Color(0xff242a54),
                fontSize: 18,
              ),
            ),
          ),
          subtitle: Transform.translate(
            offset: const Offset(-17, 0),
            child: Text(
              host,
              style: TextStyle(
                fontFamily: "ProductSans",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
