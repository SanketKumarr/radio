import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostSec extends StatelessWidget {
  final String postImage;
  final String caption;

  const PostSec({Key? key, required this.postImage, required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Stack(
            children: [
              Container(
                width: 330,
                height: 200,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.orange, width: 2),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(10),
                  // ),
                  image: DecorationImage(
                    image: AssetImage(
                      postImage,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.bookmark_border_rounded,
                    color: Color(0xff242a54),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          FontAwesomeIcons.heart,
          color: Colors.grey,
          size: 22,
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            caption,
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
