import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/Admin/Models/interview_model.dart';

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
  late final String coverPicUrl;


  InterviewTile({
    // Key? key,
    required this.title,
    required this.host,
    required this.mediaUrl,
    required this.interviewId,
    required this.coverPicUrl,

  });

  factory InterviewTile.fromDocument(DocumentSnapshot doc) {
    return InterviewTile(
      title: doc.data().toString().contains('title') ? doc.get('title') : '',
      host: doc.data().toString().contains('host') ? doc.get('host') : '',
      mediaUrl: doc.data().toString().contains('mediaUrl') ? doc.get('mediaUrl') : '',
      interviewId: doc.data().toString().contains('interviewId') ? doc.get('interviewId') : '',
      coverPicUrl: doc.data().toString().contains('coverPicUrl') ? doc.get('coverPicUrl') : '',
    );
  }

  @override
  State<InterviewTile> createState() => _InterviewTileState(
        title: this.title,
        mediaUrl: this.mediaUrl,
        host: this.host,
        interviewId: this.interviewId,
        coverPicUrl: this.coverPicUrl,
      );
}

class _InterviewTileState extends State<InterviewTile> {
  late final String title;
  late final String host;
  late final String mediaUrl;
  late final String interviewId;
  late final String coverPicUrl;


  _InterviewTileState({
    required this.title,
    required this.interviewId,
    required this.host,
    required this.mediaUrl,
    required this.coverPicUrl,
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
                coverPicUrl: coverPicUrl,
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
