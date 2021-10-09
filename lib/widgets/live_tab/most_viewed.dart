import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MostViewed extends StatelessWidget {
  const MostViewed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Most Viewed",
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w400,
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.shade100,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(5, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 75),
                      child: Text(
                        "A",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.shade100,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(5, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 75),
                      child: Text(
                        "B",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
