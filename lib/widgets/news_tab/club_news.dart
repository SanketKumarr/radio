import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/news_tab/club_news_tile.dart';

class ClubNews extends StatelessWidget {
  const ClubNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Club",
            style: TextStyle(
              color: Color(0xff242a54),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClubNewsTile(),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
