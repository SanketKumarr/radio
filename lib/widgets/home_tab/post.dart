import 'package:flutter/material.dart';

class PostSec extends StatelessWidget {
  const PostSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        children: [
          Container(
            width: 330,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
    );
  }
}