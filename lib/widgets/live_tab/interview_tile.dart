import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/live_tab/audio_screen.dart';

//Note: Global Variables:-
late String title;
late String host;
late String imageAsset;
late String audioAsset;

class InterviewTile extends StatefulWidget {
  final title;
  final host;
  final imageAsset;
  final audioAsset;

  const InterviewTile(
      {Key? key,
      required this.title,
      required this.host,
      required this.imageAsset,
      required this.audioAsset})
      : super(key: key);

  @override
  _InterviewTileState createState() => _InterviewTileState();
}

class _InterviewTileState extends State<InterviewTile> {
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
                title: widget.title,
                host: widget.host,
                imageAsset: widget.imageAsset,
                audioAsset: widget.audioAsset,
              ),
            ),
          );
        },
        child: ListTile(
          title: Transform.translate(
            offset: const Offset(-17, 0),
            child: Text(
              widget.title,
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
              widget.host,
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
