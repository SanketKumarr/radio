import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/radio_profile/content_creator/list_of_creators.dart';

class ContentCreators extends StatelessWidget {
  const ContentCreators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListOfCreators(),
              ),
            );
          },
          onLongPress: () {
            final snackBar = SnackBar(
              content: Text(
                "Tap to see all content creators",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
              duration: Duration(seconds: 4),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text(
            "Content creators",
            style: TextStyle(
              color: Color(0xff242a54),
              fontSize: 22,
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w400,
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
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.shade100,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("A"),
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
                          spreadRadius: 1.0,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("B"),
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
                          spreadRadius: 1.0,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("C"),
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
                          spreadRadius: 1.0,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("D"),
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
                          spreadRadius: 1.0,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("E"),
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
                          spreadRadius: 1.0,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("F"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
