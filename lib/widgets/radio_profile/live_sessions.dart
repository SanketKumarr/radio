import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LiveSessions extends StatelessWidget {
  const LiveSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Live sessions",
            style: TextStyle(
              color: Color(0xff242a54),
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.7,
                enableInfiniteScroll:
                true, // Fixme: to hide whitespace at the end.
                // reverse: false,
                autoPlay: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                Transform.translate(
                  offset: Offset(-50, 0),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.orange,
                              width: 2,
                            ),
                            // image: DecorationImage(
                            //   image: AssetImage(""),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "A",
                            style:
                            TextStyle(color: Color(0xff242a54), fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}