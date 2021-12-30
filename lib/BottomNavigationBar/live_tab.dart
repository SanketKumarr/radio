import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/Admin/create_interview.dart';
import 'package:radio_lnct/main.dart';
import 'package:radio_lnct/widgets/live_tab/audio_player.dart';
import 'package:radio_lnct/Admin/Models/interview_model.dart';
import 'package:radio_lnct/widgets/live_tab/interview_tile.dart';
import 'package:radio_lnct/widgets/live_tab/most_viewed.dart';

class LiveTab extends StatefulWidget {
  const LiveTab({Key? key}) : super(key: key);

  @override
  State<LiveTab> createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> {
  late AudioPlayer advancedPlayer;

  // bool isThereAnyInterview = false;
  bool isLoading = false;
  List<InterviewTile> interviews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInterviews();
    advancedPlayer = AudioPlayer();
  }

  getInterviews() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot =
        await interviewRef.orderBy('createdAt', descending: true).get();
    setState(() {
      isLoading = false;
      // isThereAnyInterview = true;
      interviews =
          snapshot.docs.map((doc) => InterviewTile.fromDocument(doc)).toList();
    });
  }

  buildInterviews() {
    if (isLoading == true) {
      return Center(
          child: CircularProgressIndicator(
        color: Color(0xff242a54),
      ));
    }
    if(interviews.isNotEmpty) {
      return Column(
        children: interviews,
      );
    }
    if(interviews.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: Text(
            "No interview yet",
            style: TextStyle(
              fontFamily: "ProductSans",
              color: Color(0xff242a54).withOpacity(0.5),
              fontSize: 25,
            ),
          ),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: const Color(0xff242a54),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 140),
                          child: Text(
                            "Mehfil-e-fursat",
                            style: TextStyle(
                              fontFamily: "ProductSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 55, right: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Our guests",
                          style: TextStyle(
                            fontFamily: "ProductSans",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff242a54),
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 150,
                            viewportFraction: 0.38,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                          ),
                          items: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.deepOrange.shade100,
                                        blurRadius: 5.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(5, 3),
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.orange,
                                    child: CircleAvatar(
                                      radius: 38,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "A",
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.deepOrange.shade100,
                                        blurRadius: 5.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(5, 3),
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.orange,
                                    child: CircleAvatar(
                                      radius: 38,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "B",
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MostViewed(),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Interviews",
                          style: TextStyle(
                            fontFamily: "ProductSans",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff242a54),
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        buildInterviews(),
                        const SizedBox(
                          height: 500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
