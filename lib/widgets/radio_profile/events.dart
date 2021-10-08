import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
            },
            child: const Text(
              "Events",
              style: TextStyle(
                color: Color(0xff242a54),
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 110,
                viewportFraction: 0.35,
                // reverse: false,
                autoPlay: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("A"),
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("B"),
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("C"),
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("D"),
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("E"),
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("F"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}