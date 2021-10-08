import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/live_tab/audio_screen.dart';

class InterviewTile extends StatefulWidget {
  const InterviewTile({Key? key}) : super(key: key);

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
              builder: (context) => const AudioScreen(),
            ),
          );
        },
        child: ListTile(
          title: Transform.translate(
            offset: const Offset(-17, 0),
            child: const Text(
              "Khushboo Gupta - SDE at Google",
              style: TextStyle(
                color: Color(0xff242a54),
                fontSize: 18,
              ),
            ),
          ),
          subtitle: Transform.translate(
            offset: const Offset(-17, 0),
            child: const Text(
              "Hosted by Ankul Kumar Singh",
            ),
          ),
        ),
      ),
    );
  }
}
