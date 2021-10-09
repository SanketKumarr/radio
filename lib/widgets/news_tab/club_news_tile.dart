import 'package:flutter/material.dart';

class ClubNewsTile extends StatelessWidget {
  const ClubNewsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.orange,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ExpansionTile(
        title: Text(
          "News title",
          style: TextStyle(
            color: Color(0xff242a54),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconColor: Color(0xff242a54),
        subtitle: Text(
          "subtitle if any",
          style: TextStyle(
            color: Color(0xff242a54),
            fontSize: 12,
          ),
        ),
        collapsedIconColor: Color(0xff242a54),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Text(
                  "News The mind of yearning saints is evil.Space of fear will oddly facilitate a hermetic lover.Mineral doesn’t cheerfully emerge any spirit — but the visitor is what disappears.",
                  style: TextStyle(
                    color: Color(0xff242a54),
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
