import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radio_lnct/main.dart';
import 'package:radio_lnct/widgets/user_profile/liked_posts.dart';
import 'package:radio_lnct/widgets/user_profile/log_out.dart';
import 'package:radio_lnct/widgets/user_profile/saved_posts.dart';
import 'package:radio_lnct/widgets/user_profile/settings.dart';

class UserProfileTab extends StatelessWidget {
  const UserProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehaviour(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        image: DecorationImage(
                          image: NetworkImage(
                            user.photoURL!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 330),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                user.displayName!,
                                style: TextStyle(
                                  fontFamily: "ProductSans",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff242a54),
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                user.email!,
                                style: TextStyle(
                                  fontFamily: "ProductSans",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff242a54),
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 180,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LikedPosts(),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.heart_solid,
                                                color: Colors.red,
                                              ),
                                              iconSize: 35,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SavedPosts(),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.bookmark_solid,
                                                color: Color(0xff242a54),
                                              ),
                                              iconSize: 35,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Settings(),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.cog,
                                                color: Color(0xff242a54),
                                              ),
                                              iconSize: 35,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                logoutConfirmation(context);
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.signOutAlt,
                                                color: Color(0xff242a54),
                                              ),
                                              iconSize: 35,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
