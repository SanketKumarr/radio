import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/radio_profile/content_creator/creator_avatar.dart';

class ListOfCreators extends StatelessWidget {
  const ListOfCreators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 30,
              ),
              color: Color(0xff242a54),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                "Content creators",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff242a54),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 40,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                // padding: EdgeInsets.all(5),
                children: [
                  CreatorAvatar(name: "A", creator_pic: "", role: "Designer"),
                  CreatorAvatar(name: "B", creator_pic: "", role: "Art"),
                  CreatorAvatar(name: "C", creator_pic: "", role: "Vocalist"),
                  CreatorAvatar(name: "D", creator_pic: "", role: "Dancer"),
                  CreatorAvatar(name: "E", creator_pic: "", role: "RJ"),
                  CreatorAvatar(name: "F", creator_pic: "", role: "Graphical designer"),
                  CreatorAvatar(name: "G", creator_pic: "", role: "craft"),
                  CreatorAvatar(name: "H", creator_pic: "", role: "Instrumentalist"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}