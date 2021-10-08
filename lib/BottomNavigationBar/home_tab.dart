import 'package:flutter/material.dart';
import 'package:radio_lnct/radio_profile.dart';
import 'package:radio_lnct/widgets/home_tab/explore.dart';
import 'package:radio_lnct/widgets/home_tab/post.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 305, top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RadioProfile(),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 13,
                          backgroundColor: Color(0xff242a54),
                          backgroundImage:
                          AssetImage("assets/images/lnct_radio_logo.png"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Hello, Sanket",
                        style: TextStyle(
                          color: Color(0xff242a54),
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "Welcome aboard",
                      style: TextStyle(
                        color: Color(0xff242a54),
                        fontSize: 15,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 55),
                      child: ExploreSec(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Today's content",
                        style: TextStyle(
                          color: Color(0xff242a54),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const PostSec(),
                    const PostSec(),
                    const PostSec(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}