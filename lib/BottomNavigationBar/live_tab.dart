import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/live_tab/audio_player.dart';
import 'package:radio_lnct/widgets/live_tab/audio_screen.dart';
import 'package:radio_lnct/widgets/live_tab/interview_tile.dart';
import 'package:radio_lnct/widgets/live_tab/most_viewed.dart';

class LiveTab extends StatefulWidget {
  const LiveTab({Key? key}) : super(key: key);

  @override
  State<LiveTab> createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> {
  late AudioPlayer advancedPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.orange,
                                child: CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
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
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.orange,
                                child: CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
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
                      /*const Text(
                        "Most Viewed",
                        style: TextStyle(
                          color: Color(0xff242a54),
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150,
                          viewportFraction: 0.8,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                        ),
                        items: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 220,
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: Colors.orange, width: 2),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "A",
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 220,
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: Colors.orange, width: 2),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "B",
                              ),
                            ],
                          ),
                        ],
                      ),*/
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
                      InterviewTile(
                        title: 'Khushboo Gupta - SDE at Google',
                        host: 'Hosted by Ankul Kumar Singh',
                        audioAsset: "assets/audios/ig_audio.mp3",
                        imageAsset: "assets/images/live_cover_1.jpg",

                      ),
                      Divider(),
                      InterviewTile(
                        title: 'Khushboo - SDE at Google',
                        host: 'Hosted by Ankul Kumar Singh',
                        audioAsset: "assets/audios/ig_audio.mp3",
                        imageAsset: "assets/images/live_cover_1.jpg",

                      ),
                      Divider(),
                      InterviewTile(
                        title: ' Gupta - SDE at Google',
                        host: 'Hosted Ankul Kumar Singh',
                        audioAsset: "assets/audios/ig_audio.mp3",
                        imageAsset: "assets/images/live_cover_1.jpg",

                      ),
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
    );
  }
}
