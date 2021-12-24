import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/Admin/create_post.dart';
import 'package:radio_lnct/Admin/post_model.dart';
import 'package:radio_lnct/main.dart';
import 'package:radio_lnct/radio_profile.dart';
import 'package:radio_lnct/widgets/home_tab/explore.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isThereAnyPost = false;
  bool isLoading = false;
  List<postModel> posts = [];

  @override
  void initState() {
    super.initState();
    getProfilePosts();
  }

  getProfilePosts() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot =
        await postRef.orderBy('createdAt', descending: true).get();
    setState(() {
      isLoading = false;
      isThereAnyPost = true;
      posts = snapshot.docs.map((doc) => postModel.fromDocument(doc)).toList();
    });
  }

  buildPosts() {
    if (isLoading == true) {
      return CircularProgressIndicator();
    }
    return Column(
      children: posts,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehaviour(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 305, top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RadioProfile(),
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 13,
                            backgroundColor: Color(0xff242a54),
                            backgroundImage:
                                AssetImage("assets/images/lnct_radio_logo.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          // Note: to display only the first name.
                          "Hello, " + user.displayName!.split(" ")[0],
                          style: TextStyle(
                            fontFamily: "ProductSans",
                            color: Color(0xff242a54),
                            fontSize: 33,
                          ),
                        ),
                      ),
                      const Text(
                        "Welcome aboard",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          color: Color(0xff242a54),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 55),
                        child: ExploreSec(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Today's content",
                          style: TextStyle(
                            fontFamily: "ProductSans",
                            color: Color(0xff242a54),
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (isThereAnyPost == false)
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Center(
                            child: Text(
                              "No post yet",
                              style: TextStyle(
                                fontFamily: "ProductSans",
                                color: Color(0xff242a54).withOpacity(0.6),
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      else
                        buildPosts(),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
