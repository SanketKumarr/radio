import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class postModel extends StatefulWidget {
  late final String postId;
  late final String mediaUrl;
  late final String description;

  postModel({
    required this.postId,
    required this.mediaUrl,
    required this.description,
  });

  factory postModel.fromDocument(DocumentSnapshot doc) {
    return postModel(
      postId: doc['postId'],
      mediaUrl: doc['mediaUrl'],
      description: doc['description'],
    );
  }

  @override
  State<postModel> createState() => _postModelState(
        postId: this.postId,
        mediaUrl: this.mediaUrl,
        description: this.description,
      );
}

class _postModelState extends State<postModel> {
  late final String postId;
  late final String mediaUrl;
  late final String description;

  _postModelState({
    required this.postId,
    required this.mediaUrl,
    required this.description,
  });

  buildPostImage() {
    return Container(
      width: 330,
      height: 330,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          image: NetworkImage(mediaUrl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildPostImage(),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
