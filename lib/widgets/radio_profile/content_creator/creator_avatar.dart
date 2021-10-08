import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/radio_profile/content_creator/creator_profile.dart';


late String name;
late String creator_pic;
late String role;

class CreatorAvatar extends StatelessWidget {

  final name;
  final creator_pic;
  final role;

  const CreatorAvatar({Key? key, required this.name, required this.creator_pic, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatorProfile(name: name, role: role, ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.orange,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(creator_pic),
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff224a54),
              ),
            ),
          ),
        ],
      ),
    );

  }
}