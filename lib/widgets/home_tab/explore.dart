import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'art_and_craft.dart';

class ExploreSec extends StatelessWidget {
  const ExploreSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Explore",
          style: TextStyle(
            color: Color(0xff242a54),
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150,
              viewportFraction: 0.7,
              enableInfiniteScroll: true,
              // Fixme: to hide whitespace at the end.
              // reverse: false,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              Transform.translate(
                offset: const Offset(-70, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ArtAndCraft(),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 110,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 75, left: 5),
                          child: Text(
                            "Art & Craft",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                          // color: Colors.,
                          gradient: const LinearGradient(
                            // begin: Alignment.centerRight,
                            // end: Alignment.topLeft,
                            colors: [
                              Color(0xffa77ab1),
                              Color(0xff747ecc),
                            ],
                          ),
                          // image: const DecorationImage(
                          //   image: AssetImage("assets/images/Home tab/art.jpg"),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-70, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 110,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 75, left: 5),
                        child: Text(
                          "Song",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: Colors.,
                        gradient: const LinearGradient(
                          // begin: Alignment.centerRight,
                          // end: Alignment.topLeft,
                          colors: [
                            Color(0xffa77ab1),
                            Color(0xff747ecc),
                          ],
                        ),
                        // image: const DecorationImage(
                        //   image: AssetImage("assets/images/Home tab/art.jpg"),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(-70, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 110,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 75, left: 5),
                        child: Text(
                          "Dance",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        // color: Colors.,
                        gradient: const LinearGradient(
                          // begin: Alignment.centerRight,
                          // end: Alignment.topLeft,
                          colors: [
                            Color(0xffa77ab1),
                            Color(0xff747ecc),
                          ],
                        ),
                        // image: const DecorationImage(
                        //   image: AssetImage("assets/images/Home tab/art.jpg"),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
