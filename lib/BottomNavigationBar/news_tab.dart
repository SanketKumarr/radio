import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/main.dart';
import 'package:radio_lnct/widgets/news_tab/clg_news.dart';
import 'package:radio_lnct/widgets/news_tab/club_news.dart';
import 'package:radio_lnct/widgets/news_tab/top_picks.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehaviour(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                        fontFamily: "ProductSans",
                        color: Color(0xff242a54),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TopPicks(),
                    SizedBox(
                      height: 40,
                    ),
                    CollegeNews(),
                    SizedBox(
                      height: 60,
                    ),
                    ClubNews(),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
