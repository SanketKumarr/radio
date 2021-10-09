// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/radio_profile/about_us.dart';
import 'package:radio_lnct/widgets/radio_profile/contact_us.dart';
import 'package:radio_lnct/widgets/radio_profile/content_creator/content_creator.dart';
import 'package:radio_lnct/widgets/radio_profile/contents.dart';
import 'package:radio_lnct/widgets/radio_profile/events.dart';
import 'package:radio_lnct/widgets/radio_profile/live_sessions.dart';

class RadioProfile extends StatelessWidget {
  const RadioProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: const Color(0xff242a54),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 18),
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140, left: 18),
                    child: Row(
                      children: [
                        const Text(
                          "RADIO",
                          style: TextStyle(
                            fontFamily: "ProductSans",
                            fontWeight: FontWeight.w500,

                            color: Colors.white,
                            // fontWeight: FontWeight.w600,
                            fontSize: 40,
                          ),
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              "assets/images/lnct_radio_logo.png",
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 45),
                child: ContentCreators(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: AboutUs(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 45),
                child: LiveSessions(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Contents(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Events(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: ContactUs(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  color: Colors.orangeAccent[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Zindagi muskurayegi",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color(0xff242a54),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1.0.1",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color(0xff242a54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
