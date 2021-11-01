import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/home_tab/post_sec.dart';

class CreatorProfile extends StatelessWidget {
  final name;
  final role;
  // TODO: add creator display pic too
  const CreatorProfile({Key? key, required this.name, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  // size: 30,
                  color: Color(0xff242a54),
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                iconSize: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Color(0xff242a54),
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            role,
                            style: TextStyle(
                              color: Color(0xff242a54),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Text(
                  "Top picks",
                  style: TextStyle(
                    color: Color(0xff242a54),
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Text(
                  "Contents",
                  style: TextStyle(
                    color: Color(0xff242a54),
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Post(
                  postImage: "assets/images/live_cover_1.jpg",
                  caption:
                  'Never invent the saint, for you cannot illuminate it. The suffering is an embittered aspect.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: const Post(
                  postImage: "assets/images/live_cover_1.jpg",
                  caption:
                  'Never invent the saint, for you cannot illuminate it. The suffering is an embittered aspect.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: const Post(
                  postImage: "assets/images/live_cover_1.jpg",
                  caption:
                  'Never invent the saint, for you cannot illuminate it. The suffering is an embittered aspect.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}