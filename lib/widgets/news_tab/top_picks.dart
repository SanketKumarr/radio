import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top picks",
            style: TextStyle(
              color: Color(0xff242a54),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.7,
              height: 160,
              reverse: false,
            ),
            items: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 110,
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
                      child: Padding(
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
            ],
          ),
        ],
      ),
    );
  }
}
