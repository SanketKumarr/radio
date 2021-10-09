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
              fontSize: 22,
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w400,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
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
                  offset: Offset(-50, 0),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
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
                          child:  Padding(
                            padding: EdgeInsets.only(top: 75, left: 5),
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
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
