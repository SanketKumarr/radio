import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 15),
              child: Text(
                "Search",
                style: TextStyle(
                  fontFamily: "ProductSans",
                  color: Color(0xff242a54),
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset("assets/illustrations/search_2.jpg",),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
