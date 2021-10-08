import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/news_tab/clg_news_tile.dart';

class CollegeNews extends StatelessWidget {
  const CollegeNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "College",
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClgNewsTile(),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
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
